;;; package --- summary:
;;; Commentary:
;;; Code:


;;; cmake-ide and its dependents.


(unless (fboundp 'levenshtein-distance)
  (leaf levenshtein
    :ensure t))

;;; cmake mode

(leaf cmake-mode
  :ensure t
  :mode ("CMakeLists.txt" . cmake-mode)
  :init (setq cmake-tab-width 4))


;;; auto completion for cmake

(leaf company-cmake
  :ensure t
  :after company cmake
  :hook (cmake-mode-hook . (lambda ()
                             (add-to-list (make-local-variable 'company-backends)
                                          'company-cmake)))
  :config ())


;;; linting cmake files

(quelpa '(cmake-compile-commands :fetcher github
                                 :repo "xwl/cmake-compile-commands"))
(quelpa '(flycheck-cmake :fetcher github
                         :repo "xwl/flycheck-cmake"))


;;; c/++ common style

(setq c-default-style "k&r"
      c-basic-offset 4)

(leaf clang-format
  :ensure t
  :config (progn (setq clang-format-style "File")))
(leaf clang-format+
  :ensure t
  :hook (c-mode-common-hook . clang-format+-mode)
  :config (progn (setq clang-format+-offset-modified-region 4)))


;;; c/++ header completion

;; (leaf company-c-headers
;;   :ensure t
;;   :after company
;;   :config (progn (add-hook 'c-mode-common-hook
;;                            (lambda ()
;;                              (add-to-list (make-local-variable 'company-backends)
;;                                           '(company-c-headers))))))


;;; c/++ language server

;; (leaf ccls
;;   :ensure t
;;   :init (require 'ccls))


;;; c/++ debug server

(require 'dap-lldb)
(setq dap-lldb-debugged-program-function 'cmake-ide-find-exe-files)


;;; static analysis with clang

(leaf flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))


;;; tidying code with clang format

(leaf flycheck-clang-tidy
  :ensure t
  :after flycheck
  :config (flycheck-clang-tidy-setup))


;;; cmake-ide

(leaf cmake-ide
  :ensure t
  :init (require 'cmake-ide)
  :config (progn (dolist (ccommon '(c-mode-hook c++-mode-hook cmake-mode-hook))
                   (add-hook ccommon
                             (lambda ()
                               (if (cide--locate-project-dir)
                                   (progn (setq-local cmake-ide-build-dir
                                                      (concat (cide--locate-project-dir) "build"))
                                          (cmake-ide-setup))))))))

(defun cmake-ide-compile* ()
  (interactive)
  (let ((old-pw default-directory))
    (cd (cide--build-dir))
    (call-interactively 'compile)
    (cd old-pw)))

(defun cmake-ide-delete-build-dir ()
  (interactive)
  (let ((dir-name (cide--build-dir)))
    (when (yes-or-no-p (format "Delete directory %s ?" dir-name))
      (delete-directory dir-name t)
      (message (format "DELETED %s" dir-name)))))


;;; gdb configuration

(setq gdb-many-windows nil
      gdb-show-main t)

;; restore current layout when exiting gdb - https://stackoverflow.com/a/41326527
(defun set-gdb-layout(&optional c-buffer)
  (if (not c-buffer)
      (setq c-buffer (window-buffer (selected-window)))) ;; save current buffer
  ;; from http://stackoverflow.com/q/39762833/846686
  (set-window-dedicated-p (selected-window) nil) ;; unset dedicate state if needed
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows) ;; clean all
  (let* ((w-source (selected-window)) ;; left top
         (w-gdb (split-window w-source (floor (* 0.65 (window-body-width))) 'right)) ;; right bottom
         (w-locals (split-window w-gdb nil 'above)) ;; right middle bottom
         (w-stack (split-window w-locals nil 'above)) ;; right middle top
         (w-breakpoints (split-window w-stack nil 'above)) ;; right top
         (w-io (split-window w-source (floor (* 0.8 (window-body-height))) 'below)) ;; left bottom
         )
    (set-window-buffer w-io (gdb-get-buffer-create 'gdb-inferior-io))
    (set-window-dedicated-p w-io t)
    (set-window-buffer w-breakpoints (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    (set-window-dedicated-p w-breakpoints t)
    (set-window-buffer w-locals (gdb-get-buffer-create 'gdb-locals-buffer))
    (set-window-dedicated-p w-locals t)
    (set-window-buffer w-stack (gdb-get-buffer-create 'gdb-stack-buffer))
    (set-window-dedicated-p w-stack t)
    (set-window-buffer w-gdb gud-comint-buffer)
    (select-window w-source)
    (set-window-buffer w-source c-buffer)))
(defvar global-config-editing (current-window-configuration)) ;; to restore: (set-window-configuration c-editing)
(defadvice gdb (around args activate)
  "Change the way to gdb works."
  (let ((c-buffer (window-buffer (selected-window))) ;; save current buffer
        )
    ad-do-it
    (set-gdb-layout c-buffer)))
(defadvice gdb-reset (around args activate)
  "Change the way to gdb exit."
  ad-do-it
  (set-window-configuration global-config-editing))


;;; cmake-ide + gdb/exec.

(defun run-process-in-comint (cmd)
  (let* ((name (format "Process: %s" cmd))
         (buf (set-buffer (generate-new-buffer name)))
         (proc nil)
         (line-- (make-string 80 ?-))
         (proc-sentinal-fn (lambda (proc evt)
                             (insert (format "%s\n%s -- %s\n%s\n" line-- evt (current-time-string) line--))))
         (comint-mode-result (comint-mode)))
    (switch-to-buffer-other-window buf)
    (insert (format "Starting: %s\n%s\n" (current-time-string) line--))
    (setq proc (start-process-shell-command name buf cmd))
    (set-process-sentinel proc (lambda (proc evt)
                                 (insert (format "==========\n%s -- (%s) %s\n"
                                                 evt
                                                 (process-exit-status proc)
                                                 (current-time-string)))))
    proc))

(defun cmake-ide-find-exe-files ()
  (interactive)
  (let* ((exec-files (seq-filter 'file-executable-p
                                 (directory-files-recursively (cide--locate-project-dir)
                                                              ".*")))
         (base-buffer-name (file-name-base (buffer-name)))
         (calc-dist (lambda (fn) (cons fn
                                       (levenshtein-distance base-buffer-name
                                                             (file-name-base fn)))))
         (cdr-< (lambda (a b)
                  (< (cdr a) (cdr b))))
         (distances (sort (mapcar calc-dist exec-files)
                          cdr-<))
         (nearest (car (first distances))))
    (cons nearest exec-files)))

(defun cmake-ide-run-gdb ()
  (interactive)
  (ivy-read "Executable file to debug"
            (cmake-ide-find-exe-files)
            :action (lambda (sel)
                      (gdb (concat gud-gdb-command-name " " sel)))))

(defun cmake-ide-run-exe ()
  (interactive)
  (ivy-read "Executable file"
            (cmake-ide-find-exe-files)
            :action (lambda (sel)
                      (run-process-in-comint sel))))


;;; object dump

(leaf disaster
  :ensure t)

(defun cmake-ide-objdump-disaster (file-name)
  (let* ((objdump-cmd (format "%s %s" disaster-objdump (shell-quote-argument file-name)))
         (buf (set-buffer (generate-new-buffer objdump-cmd))))
    (shell-command objdump-cmd buf)
    (read-only-mode)
    (asm-mode)
    (disaster--shadow-non-assembly-code)
    (switch-to-buffer-other-window buf)))

(defun cmake-ide-find-obj-files ()
  (interactive)
  (let* ((exec-files (seq-filter 'file-readable-p
                                 (directory-files-recursively
                                  (cide--build-dir) ".+\.o[bj]?$")))
         (base-buffer-name (file-name-base (buffer-name)))
         (calc-dist (lambda (fn) (cons fn
                                       (levenshtein-distance base-buffer-name
                                                             (file-name-base fn)))))
         (cdr-< (lambda (a b) (< (cdr a) (cdr b))))
         (distances (sort (mapcar calc-dist exec-files) cdr-<)))
    (mapcar 'car distances)))

(defun cmake-ide-objdump ()
  (interactive)
  (ivy-read "Object file to objdump"
            (cmake-ide-find-obj-files)
            :action (lambda (sel)
                      (cmake-ide-objdump-disaster sel))))


;; keymaps

(defvar cc-prefix-map (make-sparse-keymap))
;; Compile, CMake
(define-key cc-prefix-map "cr" 'cmake-ide-run-cmake)
(define-key cc-prefix-map "cc" 'cmake-ide-compile)
(define-key cc-prefix-map "cC" 'cmake-ide-compile*)
(define-key cc-prefix-map "cd" 'cmake-ide-delete-file)
(define-key cc-prefix-map "cD" 'cmake-ide-delete-build-dir)
;; Debugger
(define-key cc-prefix-map "db" 'cmake-ide-run-gdb)
(define-key cc-prefix-map "dx" 'cmake-ide-run-exe)
(define-key cc-prefix-map "do" 'cmake-ide-objdump)

(add-hook 'c-mode-hook
          (lambda ()
            (evil-leader/set-key-for-mode 'c-mode
              "<SPC>" cc-prefix-map)))

(add-hook 'c++-mode-hook
          (lambda ()
            (evil-leader/set-key-for-mode 'c++-mode
              "<SPC>" cc-prefix-map)))


;; FILE ".dir-locals.el"
;; ((nil . ((cmake-ide-build-dir . "./build")
;;         (flycheck-clang-tidy-build-path . "build")
;;         (cmake-ide-cmake-opts . "-DCMAKE_BUILD_TYPE=Debug -G"Unix Makefiles"))))

;; FILE ".clang-tidy"
;; Checks: '-*,clang-diagnostic-*,llvm-*,misc-*'


;;; init-ccommon.el ends here

;;; init-common.el --- configuration for c language family -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; cmake-ide and its dependents.

(unless (fboundp 'levenshtein-distance)
  (leaf levenshtein
    :straight t))


;;; cmake mode

(leaf cmake-mode
  :straight t
  :mode (("CMakeLists.txt" . cmake-mode))
  :init (setq cmake-tab-width 4))


;;; auto completion for cmake

(add-hook 'cmake-mode-hook
          (lambda ()
            (add-to-list (make-local-variable 'company-backends)
                         'company-cmake)))


;;; c/++ common style

(setq c-default-style "bsd"
      c-basic-offset 4)

(leaf clang-format
  :straight t
  :config (progn (setq clang-format-style "Microsoft")))
(leaf clang-format+
  :straight t
  :hook ((c-mode-common-hook . clang-format+-mode))
  :config (progn (setq clang-format+-offset-modified-region 4)))


;;; c/++ header completion

;; (leaf company-c-headers
;;   :straight t
;;   :after company
;;   :config (progn (add-hook 'c-mode-common-hook
;;                            (lambda ()
;;                              (add-to-list (make-local-variable 'company-backends)
;;                                           '(company-c-headers))))))


;;; c/++ language server

;; (leaf ccls
;;   :straight t
;;   :require t)

(leaf lsp-clangd
  :after lsp-mode
  :require t
  :setq ((lsp-clients-clangd-args . '("--all-scopes-completion"
                                      "--completion-style=detailed"
                                      "--header-insertion=iwyu"
                                      "--suggest-missing-includes"
                                      "-j=4"))))



;;; c/++ debug server

(leaf dap-lldb
  :after dap-mode
  :require t
  :setq ((dap-lldb-debugged-program-function . 'cmake-ide-find-exe-files)))


;;; linting with cmake

;; (leaf cmake-compile-commands
;;   :straight (cmake-compile-commands :type git
;;                                     :host github
;;                                     :repo "xwl/cmake-compile-commands"))

;; (leaf flycheck-cmake
;;   :straight (flycheck-cmake :type git
;;                             :host github
;;                             :repo "xwl/flycheck-cmake"))


;;; static analysis with clang

(leaf flycheck-clang-analyzer
  :straight t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))


;;; cmake-ide

(leaf cmake-ide
  :straight t
  :require t
  :config (progn (dolist (ccommon '(c-mode-hook c++-mode-hook cmake-mode-hook))
                   (add-hook ccommon
                             (lambda ()
                               (if (cide--locate-project-dir)
                                   (progn (setq-local cmake-ide-build-dir
                                                      (concat (cide--locate-project-dir) "build"))
                                          (cmake-ide-setup))))))))

(defun cmake-ide-compdb ()
  "Make compile_commands.json for non-cmake projects."
  (interactive)
  (shell-command (concat "compdb -p "
                         (cide--build-dir)
                         " list > "
                         (cide--locate-project-dir)
                         "compile_commands.json")))

(defun cmake-ide-delete-build-dir ()
  "Delete build directory in a cmake-ide project."
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
  "Layout for gdb."
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
  "Run CMD with comint."
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
  "Find executable files in a cmake-ide project."
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
  "Debug a file with gdb in a cmake-ide project."
  (interactive)
  (ivy-read "Executable file to debug"
            (cmake-ide-find-exe-files)
            :action (lambda (sel)
                      (gdb (concat gud-gdb-command-name " " sel)))))

(defun cmake-ide-run-exe ()
  "Run a executable file in a camke-ide project."
  (interactive)
  (ivy-read "Executable file"
            (cmake-ide-find-exe-files)
            :action (lambda (sel)
                      (run-process-in-comint sel))))


;;; object dump

(leaf disaster
  :straight t)

(defun cmake-ide-objdump-disaster (file)
  "Dump FILE with disaster."
  (let* ((objdump-cmd (format "%s %s" disaster-objdump (shell-quote-argument file)))
         (buf (set-buffer (generate-new-buffer objdump-cmd))))
    (shell-command objdump-cmd buf)
    (read-only-mode)
    (asm-mode)
    (disaster--shadow-non-assembly-code)
    (switch-to-buffer-other-window buf)))

(defun cmake-ide-find-obj-files ()
  "Find object files in a cmake-ide project."
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
  "Dump a object file in a cmake-ide project."
  (interactive)
  (ivy-read "Object file to objdump"
            (cmake-ide-find-obj-files)
            :action (lambda (sel)
                      (cmake-ide-objdump-disaster sel))))


;; keymap

(defvar custom-cc-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "r" 'cmake-ide-run-cmake)
    (define-key map "c" 'cmake-ide-compile)
    (define-key map "d" 'cmake-ide-delete-file)
    (define-key map "D" 'cmake-ide-delete-build-dir)
    (define-key map "b" 'cmake-ide-compdb)
    (define-key map "g" 'cmake-ide-run-gdb)
    (define-key map "x" 'cmake-ide-run-exe)
    (define-key map "o" 'cmake-ide-objdump)
    map))
(defalias 'c custom-cc-keymap)
(defalias 'c++ custom-cc-keymap)

(evil-leader/set-key-for-mode 'c-mode
  "<SPC>" 'c)

(evil-leader/set-key-for-mode 'c++-mode
  "<SPC>" 'c++)


;; FILE ".dir-locals.el"
;; ((nil . ((cmake-ide-build-dir . "./build")
;;         (flycheck-clang-tidy-build-path . "build")
;;         (cmake-ide-cmake-opts . "-DCMAKE_BUILD_TYPE=Debug -G"Unix Makefiles"))))

;; FILE ".clang-tidy"
;; Checks: '-*,clang-diagnostic-*,llvm-*,misc-*'


;;; init-ccommon.el ends here

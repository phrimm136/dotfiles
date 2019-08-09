;;; package --- summary:
;;; Commentary:
;;; Code:


;;; cmake-ide and its deps.

(require 'cl)


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
  :config (progn (add-hook 'cmake-mode-hook (lambda ()
                                              (add-to-list (make-local-variable 'company-backends)
                                                           '(company-cmake))))))


;;; C common style

(setq c-default-style "bsd"
      indent-tabs-mode nil
      c-basic-offset 4)


;;; static analyzer

(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-highlight-func-mode 1)
(semantic-mode 1)

(leaf stickyfunc-enhance
  :ensure t
  :config (progn (global-semantic-stickyfunc-mode 1)))


;;; rtags
;; Completion, Navigation.

(leaf rtags
  :ensure t
  :hook (c-mode-common-hook . rtags-start-process-unless-running)
  :config (progn (setq rtags-autostart-diagnostics t
                       rtags-completions-enabled t
                       rtags-path "~/.emacs.d/elpa/rtags-20190621.2006/rtags-2.33/bin"))) ; Todo: use regex for path


;;; use ivy for frontend of rtags

(leaf ivy-rtags
  :ensure t
  :after ivy rtags
  :config (setq rtags-display-result-backend 'ivy))


;;; clang format

(leaf flycheck-clang-tidy
  :ensure t
  :after flycheck
  :hook (flycheck-mode-hook . flycheck-clang-tidy-setup))

(leaf flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :hook (flycheck-mode-hook . flycheck-clang-analyzer-setup))

(leaf clang-format
  :ensure t
  :config (progn (defun clang-format-auto ()
                   (interactive)
                   (if mark-active
                       (call-interactively 'clang-format-region)
                     (clang-format-buffer)))))


;;; completion for rtags

(leaf company-rtags
  :ensure t
  :after company rtags
  :config (progn (add-hook 'c-mode-common-hook (lambda ()
                                                 (add-to-list (make-local-variable 'company-backends)
                                                              '(company-rtags))))))

(leaf company-c-headers
  :ensure t
  :after company
  :config (progn (add-hook 'c-mode-common-hook (lambda ()
                                                 (add-to-list (make-local-variable 'company-backends)
                                                              '(company-c-headers))))))


;;; Rtags + Eldoc:
;; https://github.com/Andersbakken/rtags/issues/987

(defun fontify-string (str mode)
  "Return STR fontified according to MODE."
  (with-temp-buffer (insert str)
                    (delay-mode-hooks (funcall mode))
                    (font-lock-default-function mode)
                    (font-lock-default-fontify-region (point-min) (point-max) nil)
                    (buffer-string)))

(defun rtags-eldoc-function ()
  (let ((summary (rtags-get-summary-text)))
    (and summary (fontify-string (replace-regexp-in-string "{[^}]*$" ""
                                                           (mapconcat (lambda (str)
                                                                        (if (= 0 (length str))
                                                                            "//"
                                                                          (string-trim str)))
                                                                      (split-string summary "\r?\n")
                                                                      " "))
                                 major-mode))))

(defun rtags-eldoc-mode ()
  (interactive)
  (setq-local eldoc-documentation-function #'rtags-eldoc-function)
  (eldoc-mode 1))

(add-hook 'c-mode-common-hook 'rtags-eldoc-mode)


;;; hinting function arguments

(leaf function-args
  :ensure t
  :config (progn (fa-config-default)
                 (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
                 (set-default 'semantic-case-fold t)
                 (require 'semantic/bovine/c)
                 (add-to-list 'semantic-lex-c-preprocessor-symbol-file
                              (concat "/usr/lib/gcc/x86_64-pc-linux-gnu/^[0-9\.0-9\.0-9]$/include/stddef.h"))))


;;; cmake-ide

(leaf cmake-ide
  :ensure t
  :after rtags
  :config (progn (cmake-ide-setup)
                 (setq cmake-ide-build-dir "./build")))

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

(setq gdb-many-windows t
      gdb-show-main t)


;;; cmake-ide + gdb/exec.

(defun run-process-in-comint (cmd)
  (let* ((name (format "Process: %s" cmd))
         (buf (set-buffer (generate-new-buffer name)))
         (proc nil)
         (line-- (make-string 80 ?-))
         (proc-sentinal-fn (lambda (proc evt)
                             (insert (format "%s\n%s -- %s\n%s\n" line-- evt (current-time-string) line--))))
         (comint-mode-result (comint-mode)))
    ;;
    (switch-to-buffer-other-window buf)
    ;;
    (insert (format "Starting: %s\n%s\n" (current-time-string) line--))
    (setq proc (start-process-shell-command name buf cmd))
    (set-process-sentinel proc (lambda (proc evt)
                                 (insert (format "==========\n%s -- (%s) %s\n"
                                                 evt
                                                 (process-exit-status proc)
                                                 (current-time-string)))))
    ;;
    proc))

(defun cmake-ide-find-exe-files ()
  (interactive)
  (let* ((exec-files (seq-filter 'file-executable-p
                                 (directory-files-recursively (cide--build-dir)
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


;; FILE ".dir-locals.el"
;; ((nil . ((cmake-ide-build-dir . "./_build")
;;         (flycheck-clang-tidy-build-path . "_build")
;;         (cmake-ide-cmake-opts . "-DCMAKE_BUILD_TYPE=Debug -G"Unix Makefiles"))))

;; FILE ".clang-tidy"
;; Checks: '-*,clang-diagnostic-*,llvm-*,misc-*'


;;; cmake-ide.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


(let ((gc-cons-threshold (* 50 1000 1000)))
  ;; Set load pathes and load configures.
  (eval-when-compile
    (defun load-directory (dir)
      "Load all Emacs Lisp files in DIR."
      (let ((load-it (lambda (f)
		       (load-file (concat (file-name-as-directory dir) f)))))
        (mapc load-it (directory-files dir nil "\\.el$")))))
  (defvar base-path (expand-file-name "config/base" user-emacs-directory))
  (defvar utils-path (expand-file-name "config/utils" user-emacs-directory))
  (defvar modes-path (expand-file-name "config/modes" user-emacs-directory))
  (defvar term-path (expand-file-name "config/term" user-emacs-directory))
  (defvar ui-path (expand-file-name "config/ui" user-emacs-directory))
  (load-theme 'black t)
  (load-directory base-path)
  (load-directory utils-path)
  (load-directory modes-path)
  (load-directory term-path)
  (load-directory ui-path)

  (kill-buffer "*Messages*")
  ;; To hook functions to message buffer correctly, I had to kill it ans leave it opened again.
  ;;; Weird method, losing startup log but simple.
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("24fff235838e7aec420e054afb78d72a60a8c4861e0254ab8a7ff6e485c69807" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here

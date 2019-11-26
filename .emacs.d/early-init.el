;;; package --- summary:
;;; Commentary:
;;; Code:

;;; use straight instead of package for pacman

(let ((gc-cons-threshold (* 50 1000 1000)))
  (menu-bar-mode 0)
  (tool-bar-mode 0) ;; no more mouse
  (bug-reference-mode 0)
  (add-to-list 'default-frame-alist '(font . "DejaVuSansMono Nerd Font-6")) ;; font
  (set-frame-parameter (selected-frame) 'alpha '(80 80)) ;; transparency

  (setq package-enable-at-startup nil)
  (defvar bootstrap-version)
  (let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
        (bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
          (url-retrieve-synchronously "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
                                      'silent 'inhibit-cookies)
        (goto-char (point-max))
        (eval-print-last-sexp)))
    (load bootstrap-file nil 'nomessage))

  (setq straight-check-for-modifications nil
        straight-enable-package-ntegration nil
        straight-vc-git-default-clone-depth 1
        straight-recipes-emacsmirror-use-mirror t)

  (straight-use-package 'leaf)
  (straight-use-package 'leaf-keywords)
  (leaf-keywords-init)
  (straight-use-package 'bind-key)
  (require 'bind-key))


;;; early-init.el ends here

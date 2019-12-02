;;; package --- summary:
;;; Commentary:
;;; Code:

;;; use straight instead of package for pacman

(menu-bar-mode 0)
(tool-bar-mode 0) ;; no more mouse
(bug-reference-mode 0)
(add-to-list 'default-frame-alist '(font . "DejaVuSansMono Nerd Font-6")) ;; font
(set-frame-parameter (selected-frame) 'alpha '(80 80)) ;; transparency

(advice-add #'x-apply-session-resources :override #'ignore)

(setq package-enable-at-startup nil)


;;; early-init.el ends here

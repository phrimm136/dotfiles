;;; package --- summary:
;;; Commentary:
;;; Code:


;;; no more mouse
(menu-bar-mode 0)
(tool-bar-mode 0)


;;; transparency

(set-frame-parameter (selected-frame) 'alpha '(80 80))


;;; font

(set-face-attribute 'default nil :family "DejaVuSansMono Nerd Font")
(set-face-attribute 'default nil :height 60)
(set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
(setq face-font-rescale-alist
      '(("NanumGothicCoding" . 1.2)))


;;; misc

(advice-add #'x-apply-session-resources :override #'ignore)

(setq package-enable-at-startup nil)


;;; early-init.el ends here

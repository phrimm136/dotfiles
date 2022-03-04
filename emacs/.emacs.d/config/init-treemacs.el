;;; init.treemacs.el --- configuration for treemacs -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:


(leaf treemacs
  :straight t
  :setq ((treemacs-defered-git-apply-delay . 0)
         (treemacs-file-follow-delay . 2)
         (treemacs-show-cursor . nil)
         (treemacs-silent-filewatch . t)
         (treemacs-silent-refresh . t))
  :config (progn (treemacs-resize-icons 12))
  :bind ((:evil-normal-state-map
          ("C-<tab>" . treemacs))
         (:treemacs-mode-map
          ("C-<SPC>" . counsel-M-x))))


;;; evil-mode integration

(leaf treemacs-evil
  :straight t
  :require t)


;;; magit integration

(leaf treemacs-magit
  :straight t)


;;; projectile integration

(leaf treemacs-projectile
  :straight t)


;;; init-treemacs.el ends here

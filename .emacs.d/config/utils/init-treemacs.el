;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf treemacs
  :ensure t
  :leaf-defer nil
  :setq ((treemacs-defered-git-apply-delay . 0)
         (treemacs-file-follow-delay . 2)
         (treemacs-show-cursor . nil)
         (treemacs-silent-filewatch . t)
         (treemacs-silent-refresh . t))
  :config (progn (treemacs-resize-icons 12)
                 (treemacs-follow-mode t)
                 (treemacs-filewatch-mode t)))


(leaf treemacs-evil
  :ensure t
  :init (require 'treemacs-evil))


(leaf treemacs-magit
  :ensure t)


(leaf treemacs-projectile
  :ensure t)


(leaf lsp-treemacs
  :ensure t
  :config ())


;;; init-treemacs.el ends here

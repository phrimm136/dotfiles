;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf treemacs
  :straight t
  :hook (treemacs-mode-hook . (lambda ()
                                (with-current-buffer (treemacs-get-local-buffer)
                                  (setq-local face-remapping-alist
                                              '((default . (:background "#121212")))))))
  :setq ((treemacs-defered-git-apply-delay . 0)
         (treemacs-file-follow-delay . 2)
         (treemacs-show-cursor . nil)
         (treemacs-silent-filewatch . t)
         (treemacs-silent-refresh . t))
  :config (progn (treemacs-resize-icons 12))
  :bind ((:evil-normal-state-map
          ("C-<tab>" . treemacs))))


(leaf treemacs-evil
  :straight t
  :init (require 'treemacs-evil))


(leaf treemacs-magit
  :straight t)


(leaf treemacs-projectile
  :straight t)


;;; init-treemacs.el ends here

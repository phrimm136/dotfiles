;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf projectile
  :ensure t
  :config (progn (projectile-mode t)
                 (evil-leader/set-key
                   "p" projectile-command-map)))


;;; init-projectile.el ends here

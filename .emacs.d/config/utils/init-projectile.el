;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf projectile
  :ensure t
  :leaf-defer nil
  :config (progn (projectile-mode t)))


;;; keymap

(defalias 'prejectile-custom-prefix projectile-command-map)

(evil-leader/set-key
  "p" projectile-command-map)


;;; init-projectile.el ends here

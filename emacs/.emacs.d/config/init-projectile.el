;;; init-projectile --- configuration for projectile -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf projectile
  :straight t
  :leaf-defer nil
  :config (progn (projectile-mode t)))


;;; keymap

(defalias 'prejectile-custom-prefix projectile-command-map)

(evil-leader/set-key
  "p" projectile-command-map)


(provide 'init-projectile)

;;; init-projectile.el ends here

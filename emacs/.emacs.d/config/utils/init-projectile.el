;;; init-projectile --- configuration for projectile -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf projectile
  :straight t
  :leaf-defer nil
  :config (progn (projectile-mode t)))


;;; counsel integration

(leaf counsel-projectile
  :straight t
  :leaf-defer nil
  :after projectile
  :config (progn (counsel-projectile-mode t))
  :bind ((:projectile-command-map
          ("f" . counsel-projectile-find-file)
          ("g" . counsel-projectile-find-file-dwim)
          ("d" . counsel-projectile-find-dir)
          ("b" . counsel-projectile-switch-to-buffer)
          ("sg" . counsel-projectile-grep)
          ("ss" . counsel-projectile-ag)
          ("sr" . counsel-projectile-rg))))


;;; keymap

(defalias 'prejectile-custom-prefix projectile-command-map)

(evil-leader/set-key
  "p" projectile-command-map)


;;; init-projectile.el ends here

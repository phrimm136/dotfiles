;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf counsel
  :ensure t
  :config (progn (evil-define-key 'normal 'global
                   (kbd "C-SPC") 'counsel-M-x)
                 (evil-leader/set-key
                   "gf" 'counsel-find-file
                   "gr" 'counsel-recentf
                   "gb" 'counsel-switch-buffer
                   "gk" 'kill-buffer
                   "gs" 'counsel-semantic-or-imenu
                   "gd" 'delete-file
                   "gm" 'manual-entry
                   "gp" 'pop-to-buffer
                   "gy" 'counsel-yank-pop
                   "go" 'find-file-other-window)))

(leaf counsel-projectile
  :ensure t
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


(leaf swiper
  :ensure t
  :config (progn (evil-define-key 'normal 'global
                   "\C-s" 'swiper)))


(leaf ivy
  :ensure t
  :leaf-defer nil
  :setq ((ivy-wrap . t)
         (ivy-re-builders-alist . '((swiper . ivy--regex)
                                    (t . ivy--regex-fuzzy)))
         (ivy-count-format . "%d/%d ")
         (ivy-use-selectable-prompt . t))
  :config (progn (ivy-mode 1))
  :bind ((:ivy-switch-buffer-map
          ("C-j" . ivy-next-line)
          ("C-k" . ivy-previous-line))
         (:ivy-minibuffer-map
          ("C-j" . ivy-next-line)
          ("C-k" . ivy-previous-line))))


;;; init-counsel.el ends here

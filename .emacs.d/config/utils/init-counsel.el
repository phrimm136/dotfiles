;;; package --- summary:
;;; Commentary:
;;; Code:


;;; counsel

(leaf counsel
  :straight t
  :config (progn (evil-define-key 'normal 'global
                   (kbd "C-SPC") 'counsel-M-x)))

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


;;; swiper

(leaf swiper
  :straight t
  :config (progn (evil-define-key 'normal 'global
                   "\C-s" 'swiper)))


;;; ivy

(leaf ivy
  :straight t
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


;;; more information for ivy

(leaf ivy-rich
  :straight t
  :after ivy
  :config (progn (ivy-rich-mode 1)))


;;; keymap

(defvar custom-counsel-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "f" 'counsel-find-file)
    (define-key map "r" 'counsel-recentf)
    (define-key map "b" 'counsel-switch-buffer)
    (define-key map "k" 'kill-buffer)
    (define-key map "s" 'counsel-imenu)
    (define-key map "d" 'delete-file)
    (define-key map "m" 'manual-entry)
    (define-key map "p" 'pop-to-buffer)
    (define-key map "y" 'counsel-yank-pop)
    (define-key map "o" 'find-file-other-window)
    (define-key map "h" 'counsel-rhythmbox)
    map))
(defalias 'counsel custom-counsel-keymap)

(evil-leader/set-key
  "r" 'counsel)


;;; init-counsel.el ends here

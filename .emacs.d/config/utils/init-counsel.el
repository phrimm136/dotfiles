;;; package --- summary:
;;; Commentary:
;;; Code:


;;; counsel

(leaf counsel
  :straight t
  :bind ((:evil-normal-state-map
          ("C-SPC" . counsel-M-x))))


;;; swiper

(leaf swiper
  :straight t
  :bind ((:evil-normal-state-map
          ("C-s" . swiper))))


;;; ivy

(leaf ivy
  :straight t
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
          ("C-k" . ivy-previous-line))
         (:minibuffer-local-map
          ("C-j" . next-line-or-history-element)
          ("C-k" . previous-line-or-history-element))))


;;; more information for ivy

(leaf ivy-rich
  :straight t
  :config (progn (ivy-rich-mode 1)))


;;; hydra keymap for ivy

(leaf ivy-hydra
  :straight t)


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
  "g" 'counsel)


;;; init-counsel.el ends here

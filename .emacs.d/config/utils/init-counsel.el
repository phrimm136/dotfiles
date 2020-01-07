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
  :init (setq ivy-rich-display-transformers-list '(ivy-switch-buffer
                                                   (:columns
                                                    ((ivy-rich-candidate (:width 35))
                                                     (ivy-rich-switch-buffer-project (:width 15 :face success))
                                                     (ivy-rich-switch-buffer-major-mode (:width 73 :face warning)))
                                                    :predicate
                                                    (lambda (cand) (get-buffer cand)))
                                                   counsel-M-x
                                                   (:columns
                                                    ((counsel-M-x-transformer (:width 75))
                                                     (ivy-rich-counsel-function-docstring (:width 94 :face font-lock-doc-face))))
                                                   counsel-describe-function
                                                   (:columns
                                                    ((counsel-describe-function-transformer (:width 35))
                                                     (ivy-rich-counsel-function-docstring (:width 94 :face font-lock-doc-face))))
                                                   counsel-describe-variable
                                                   (:columns
                                                    ((counsel-describe-variable-transformer (:width 35))
                                                     (ivy-rich-counsel-variable-docstring (:width 94 :face font-lock-doc-face))))
                                                   package-install
                                                   (:columns
                                                    ((ivy-rich-candidate (:width 25))
                                                     (ivy-rich-package-version (:width 12 :face font-lock-comment-face))
                                                     (ivy-rich-package-archive-summary (:width 7 :face font-lock-builtin-face))
                                                     (ivy-rich-package-install-summary (:width 83 :face font-lock-doc-face))))))
  :config (progn (ivy-rich-mode +1)
                 (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)))

;;; upper ivy

(leaf ivy-posframe
  :straight t
  :setq ((ivy-posframe-display-functions-alist . '((t . ivy-posframe-display-at-frame-top-center)))
         (ivy-posframe-height-alist . '((t . 15)))
         (ivy-posframe-parameters . '((internal-border-width . 0)
                                      (left-fringe . 8)
                                      (right-fringe . 8)))
         (ivy-posframe-width . 170))
  :config (progn (ivy-posframe-mode 1)))


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

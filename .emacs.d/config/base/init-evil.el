;;; package --- summary:
;;; Commentary:
;;; Code:

(leaf evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :config (progn (evil-mode 1)
                 (evil-define-key 'normal 'global
                   "\C-j" 'forward-sexp
                   "\C-k" 'backward-sexp)
                 ;; minibuffer keymap custom
                 (define-key minibuffer-local-map
                   "\C-j" 'next-line-or-history-element)
                 (define-key minibuffer-local-map
                   "\C-k" 'previous-line-or-history-element)))


(leaf evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))


(leaf evil-leader
  :ensure t
  :after evil
  :config (progn (global-evil-leader-mode)
                 (evil-leader/set-leader "<SPC>")
                 (evil-leader/set-key
                   "<RET>" 'revert-buffer
                   ":" 'eval-expression
                   ;; narrowing
                   "nf" 'narrow-to-defun
                   "nr" 'narrow-to-region
                   "nw" 'widen
                   ;; function for functions
                   "[" 'beginning-of-defun
                   "]" 'end-of-defun
                   "v" 'mark-defun)))



(leaf evil-multiedit
  :ensure t
  :leaf-defer nil
  :after evil
  :config (progn (leaf iedit
                   :ensure t
                   :leaf-defer nil
                   :bind ((:iedit-mode-occurrence-keymap
                           ("j" . iedit-next-occurrence)
                           ("k" . iedit-prev-occurrence))))
                 (evil-leader/set-key
                   "ea" 'evil-multiedit-match-all
                   "ee" 'evil-multiedit-match-and-next
                   "er" 'evil-multiedit-restore))
  :bind ((:evil-multiedit-state-map
          ("C-j" . evil-multiedit-match-and-next)
          ("C-k" . evil-multiedit-match-and-prev))))


(leaf evil-surround
  :ensure t
  :config (global-evil-surround-mode))


(leaf evil-nerd-commenter
  :ensure t
  :config (progn (evil-leader/set-key
                   ";i" 'evilnc-comment-or-uncomment-lines
                   ";l" 'evilnc-quick-comment-or-uncomment-to-the-line
                   ";c" 'evilnc-copy-and-comment-lines
                   ";p" 'evilnc-comment-or-uncomment-paragraphs
                   ";r" 'comment-or-uncomment-region
                   ";v" 'evilnc-toggle-invert-comment-line-by-line
                   ";o" 'evilnc-copy-and-comment-operator
                   ";k" 'evilnc-comment-and-kill-ring-save)))


(leaf evil-magit
  :ensure t
  :after magit
  :config (progn (evil-magit-init)))

;;; init-evil.el ends here

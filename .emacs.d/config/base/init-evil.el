;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf evil
  :straight t
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
  :straight t
  :after evil
  :config (evil-collection-init))


(leaf evil-multiedit
  :straight t
  :leaf-defer nil
  :after evil
  :config (progn (leaf iedit
                   :straight t
                   :leaf-defer nil)
                 (defvar custom-evil-multiedit-keymap
                   (let ((map (make-sparse-keymap)))
                     (define-key map "a" 'evil-multiedit-match-all)
                     (define-key map "e" 'evil-multiedit-match-and-next)
                     (define-key map "r" 'evil-multiedit-restore)
                     map))
                 (defalias 'evil-multiedit custom-evil-multiedit-keymap))
  :bind ((:evil-multiedit-state-map
          ("j" . iedit-next-occurrence)
          ("k" . iedit-prev-occurrence)
          ("C-j" . evil-multiedit-match-and-next)
          ("C-k" . evil-multiedit-match-and-prev))))


(leaf evil-surround
  :straight t
  :config (global-evil-surround-mode))


(leaf evil-nerd-commenter
  :straight t
  :config (progn (defvar custom-evil-nerd-comment-keymap
                   (let ((map (make-sparse-keymap)))
                     (define-key map "i" 'evilnc-comment-or-uncomment-lines)
                     (define-key map "l" 'evilnc-quick-comment-or-uncomment-to-the-line)
                     (define-key map "c" 'evilnc-copy-and-comment-lines)
                     (define-key map "p" 'evilnc-comment-or-uncomment-paragraphs)
                     (define-key map "r" 'comment-or-uncomment-region)
                     (define-key map "v" 'evilnc-toggle-invert-comment-line-by-line)
                     (define-key map "o" 'evilnc-copy-and-comment-operator)
                     (define-key map "k" 'evilnc-comment-and-kill-ring-save)
                     map))
                 (defalias 'evil-nerd-comment custom-evil-nerd-comment-keymap)))


(leaf evil-magit
  :straight t
  :after magit
  :config (progn (evil-magit-init)))


(leaf evil-smartparens
  :straight t
  :after smartparens
  :hook (smartparens-enabled-hook . evil-smartparens-mode))


(leaf evil-leader
  :straight t
  :after evil
  :config (progn (global-evil-leader-mode t)
                 (evil-leader/set-leader "<SPC>")
                 (evil-leader/set-key
                   "0" 'delete-window
                   "1" 'delete-other-windows
                   "2" 'split-window-below
                   "3" 'split-window-right
                   "4" 'ctl-x-4-prefix
                   "5" 'ctl-x-5-prefix
                   "6" '2C-command
                   "8" 'iso-transl-ctl-x-8-map
                   "e" 'evil-multiedit
                   "h" 'help-command
                   "q" 'save-buffers-kill-terminal
                   ":" 'eval-expression
                   ";" 'evil-nerd-comment
                   "<RET>" 'revert-buffer
                   ;; function for functions
                   "[" 'beginning-of-defun
                   "]" 'end-of-defun
                   "v" 'mark-defun)))



;;; init-evil.el ends here

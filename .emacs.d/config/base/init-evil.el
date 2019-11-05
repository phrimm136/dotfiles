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


(leaf evil-multiedit
  :ensure t
  :leaf-defer nil
  :after evil
  :config (progn (leaf iedit
                   :ensure t
                   :leaf-defer nil)
                 (defvar evil-multiedit-custom-keymap
                   (let ((map (make-sparse-keymap)))
                     (define-key map "a" 'evil-multiedit-match-all)
                     (define-key map "e" 'evil-multiedit-match-and-next)
                     (define-key map "r" 'evil-multiedit-restore)
                     map)))
  :bind ((:evil-multiedit-state-map
          ("j" . iedit-next-occurrence)
          ("k" . iedit-prev-occurrence)
          ("C-j" . evil-multiedit-match-and-next)
          ("C-k" . evil-multiedit-match-and-prev))))


(leaf evil-surround
  :ensure t
  :config (global-evil-surround-mode))


(leaf evil-nerd-commenter
  :ensure t
  :config (progn (defvar evil-nerd-comment-custom-keymap
                   (let ((map (make-sparse-keymap)))
                     (define-key map "i" 'evilnc-comment-or-uncomment-lines)
                     (define-key map "l" 'evilnc-quick-comment-or-uncomment-to-the-line)
                     (define-key map "c" 'evilnc-copy-and-comment-lines)
                     (define-key map "p" 'evilnc-comment-or-uncomment-paragraphs)
                     (define-key map "r" 'comment-or-uncomment-region)
                     (define-key map "v" 'evilnc-toggle-invert-comment-line-by-line)
                     (define-key map "o" 'evilnc-copy-and-comment-operator)
                     (define-key map "k" 'evilnc-comment-and-kill-ring-save)
                     map))))


(leaf evil-magit
  :ensure t
  :after magit
  :config (progn (evil-magit-init)))


(leaf evil-smartparens
  :ensure t
  :after smartparens
  :hook ((prog-mode-hook org-mode-hook text-mode-hook) . evil-smartparens-mode))


(leaf evil-leader
  :ensure t
  :after evil
  :config (progn (global-evil-leader-mode)
                 (evil-leader/set-leader "<SPC>")
                 (evil-leader/set-key
                   "<RET>" 'revert-buffer
                   ":" 'eval-expression
                   "h" 'help-command
                   "8" 'iso-transl-ctl-x-8-map
                   "e" evil-multiedit-custom-keymap
                   ";" evil-nerd-comment-custom-keymap
                   ;; function for functions
                   "[" 'beginning-of-defun
                   "]" 'end-of-defun
                   "v" 'mark-defun)))



;;; init-evil.el ends here

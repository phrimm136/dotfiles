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
  :config (evil-collection-init))


(leaf evil-leader
  :straight t
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
                   "h" 'help-command
                   "q" 'save-buffers-kill-terminal
                   ":" 'eval-expression
                   "<RET>" 'revert-buffer
                   ;; function for functions
                   "[" 'beginning-of-defun
                   "]" 'end-of-defun
                   "v" 'mark-defun)))


(leaf evil-multiedit
  :straight t
  :leaf-defer nil
  :config (progn (defvar custom-evil-multiedit-keymap
                   (let ((map (make-sparse-keymap)))
                     (define-key map "a" 'evil-multiedit-match-all)
                     (define-key map "e" 'evil-multiedit-match-and-next)
                     (define-key map "r" 'evil-multiedit-restore)
                     (define-key map "s" 'evil-multiedit-ex-match)
                     map))
                 (defalias 'evil-multiedit custom-evil-multiedit-keymap)
                 (evil-leader/set-key
                   "e" 'evil-multiedit))
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
                 (defalias 'evil-nerd-comment custom-evil-nerd-comment-keymap)
                 (evil-leader/set-key
                   ";" 'evil-nerd-comment)))


;; (leaf evil-args)


(leaf evil-exchange
  :straight t
  :config (progn (evil-leader/set-key
                   "c" 'evil-exchange
                   "C" 'evil-exchange-cancle)))


(leaf evil-matchit
  :straight t
  :hook ((prog-mode-hook org-mode-hook) . turn-on-evil-matchit-mode))


(leaf evil-numbers
  :straight t
  :leaf-defer nil
  :bind ((:evil-normal-state-map
          ("+" . evil-numbers/inc-at-pt)
          ("-" . evil-numbers/dec-at-pt))
         (:evil-visual-state-map
          ("+" . evil-numbers/inc-at-pt)
          ("-" . evil-numbers/dec-at-pt))))


(leaf evil-visualstar
  :straight t
  :setq ((evil-visualstar/persistent . t))
  :config (global-evil-visualstar-mode))


(leaf evil-lion
  :straight t
  :config (evil-lion-mode))


(leaf evil-quickscope
  :straight t
  :config (global-evil-quickscope-always-mode 1))


;;; init-evil.el ends here

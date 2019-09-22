;;; package --- summary:
;;; Commentary:
;;; Code:


;;; Evil keymap settings.

(progn ()
       ;; global keymap custom
       (evil-leader/set-key
         "<RET>" 'revert-buffer
         ":" 'eval-expression
         ;; handle files and buffers
         "gf" 'counsel-find-file
         "gr" 'counsel-recentf
         "gb" 'counsel-switch-buffer
         "gk" 'kill-buffer
         "gs" 'counsel-semantic-or-imenu
         "gd" 'delete-file
         "gm" 'manual-entry
         ;; undo tree
         "u" 'undo-tree-visualize
         ;; commenting lines
         ";i" 'evilnc-comment-or-uncomment-lines
         ";l" 'evilnc-quick-comment-or-uncomment-to-the-line
         ";c" 'evilnc-copy-and-comment-lines
         ";p" 'evilnc-comment-or-uncomment-paragraphs
         ";r" 'comment-or-uncomment-region
         ";v" 'evilnc-toggle-invert-comment-line-by-line
         ";o" 'evilnc-copy-and-comment-operator
         ";k" 'evilnc-comment-and-kill-ring-save
         ;; narrowing
         "nf" 'narrow-to-defun
         "nr" 'narrow-to-region
         "nw" 'widen
         ;; function for functions
         "[" 'beginning-of-defun
         "]" 'end-of-defun
         "v" 'mark-defun)
       (global-unset-key "\C-j")
       (global-unset-key "\C-k")
       (evil-define-key 'insert 'global
         "\C-j" 'nil
         "\C-k" 'nil)
       (evil-define-key 'normal 'global
         "\C-j" 'forward-sexp
         "\C-k" 'backward-sexp)
       ;; shell keymap custom
       (evil-define-key 'insert eshell-mode-map
         "\C-k" 'eshell-previous-input
         "\C-j" 'eshell-next-input)
       ;; minibuffer keymap custom
       (define-key minibuffer-local-map
         "\C-j" 'next-line-or-history-element)
       (define-key minibuffer-local-map
         "\C-k" 'previous-line-or-history-element))


(provide 'init-keymap)
;;; keymap.el ends here

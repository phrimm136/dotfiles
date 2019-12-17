;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf smartparens
  :straight t
  :init (require 'smartparens-config)
  :setq ((sp-ignore-modes-list . (delete 'minibuffer-inactive-mode sp-ignore-modes-list))
         (sp-escape-quotes-after-insert . nil))
  :config (progn (smartparens-global-strict-mode)
                 (when (version<= "27" emacs-version)
                   (dolist (parens '(c-electric-paren c-electric-brace c-electric-slash))
                     (add-to-list 'sp--special-self-insert-commands parens)))
                 (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
                 (sp-local-pair 'minibuffer-inactive-mode "`" nil :actions nil)
                 (sp-local-pair 'snippet-mode "'" nil :actions nil)
                 (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
                 (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
                 (defvar custom-smartparens-keymap
                   (let ((map (make-sparse-keymap)))
                     (define-key map "j" 'sp-forward-slurp-sexp)
                     (define-key map "k" 'sp-backward-slurp-sexp)
                     (define-key map "J" 'sp-forward-barf-sexp)
                     (define-key map "K" 'sp-backward-barf-sexp)
                     (define-key map "a" 'sp-absorb-sexp)
                     (define-key map "c" 'sp-join-sexp) ; concat
                     (define-key map "d" 'sp-kill-hybrid-sexp)
                     (define-key map "r" 'sp-raise-sexp)
                     (define-key map "s" 'sp-split-sexp)
                     (define-key map "t" 'sp-transpose-hybrid-sexp)
                     map))
                 (defalias 'smartparens custom-smartparens-keymap)
                 (evil-leader/set-key
                   "s" 'smartparens))
  :bind ((:evil-normal-state-map
          ("C-h" . sp-beginning-of-sexp)
          ("C-j" . sp-up-sexp)
          ("C-k" . sp-down-sexp)
          ("C-l" . sp-end-of-sexp))
         (:evil-visual-state-map
          ("C-h" . sp-beginning-of-sexp)
          ("C-j" . sp-up-sexp)
          ("C-k" . sp-down-sexp)
          ("C-l" . sp-end-of-sexp))))


;;; evil-mode integration

(leaf evil-smartparens
  :straight t
  :after smartparens
  :hook ((smartparens-enabled-hook . evil-smartparens-mode)))


;;; init-smartparens.el ends here

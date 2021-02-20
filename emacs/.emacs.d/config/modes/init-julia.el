;;; init-julia.el --- configuration for julia language -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; autostart

(leaf julia-mode
  :straight t)


;;; linting

;; (leaf flycheck-julia
;;   :straight t
;;   :after flycheck julia-mode
;;   :config (progn (flycheck-julia-setup)))


;;; math symbol candidates

(add-hook 'julia-mode-hook (lambda ()
                             (add-to-list (make-local-variable 'company-backends) 'company-math-symbols-unicode)))


;;; better repl setting

(leaf julia-repl
  :straight t
  :hook (julia-mode-hook . julia-repl-mode))


;;; julia language server

(leaf lsp-julia
  :straight (lsp-julia :type git
                       :host github
                       :repo "non-Jedi/lsp-julia")
  :require t
  :after lsp-mode
  :setq ((lsp-julia-default-environment .  "~/.julia/environments/v1.5"))
  :config (progn ))


;;; keymap

(defvar custom-julia-eval-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "r" 'julia-repl-send-region-or-line)
    (define-key map "b" 'julia-repl-send-buffer)
    map))
(defalias 'julia-eval custom-julia-eval-keymap)

(defvar custom-julia-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "e" 'julia-eval)
    (define-key map "j" 'julia-repl)
    (define-key map (kbd "RET") 'julia-repl-send-line)
    (define-key map "E" 'julia-repl-edit)
    (define-key map "d" 'julia-repl-doc)
    (define-key map "m" 'julia-repl-macroexpand)
    (define-key map "p" 'julia-repl-cd)
    (define-key map "a" 'julia-repl-activate-parent)
    map))
(defalias 'julia custom-julia-keymap)

(evil-leader/set-key-for-mode 'julia-mode
  "<SPC>" 'julia)


;;; init-julia.el ends here

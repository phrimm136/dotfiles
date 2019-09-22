;;; package --- summary:
;;; Commentary:
;;; Code:

;;; autostart

(leaf clojure-mode
  :ensure t
  :hook (clojure-mode-hook . cider-jack-in))


;;; colorful parenthesis

(leaf rainbow-delimiters
  :ensure t
  :hook (clojure-mode-hook . rainbow-delimiters-mode))


;;; clojure language server

(with-eval-after-load "lsp"
  (add-to-list 'lsp-language-id-configuration '(clojure-mode . "clojure-mode")))


;;; linter

(leaf flycheck-clojure
  :ensure t
  :after flycheck clojure-mode
  :config (progn (flycheck-clojure-setup)))

(add-hook 'cider-mode-hook
          (lambda ()
            (setq next-error-function #'flycheck-next-error-function)))


;;; auto completion

(eval-after-load "company" (add-hook 'cider-mode-hook #'company-mode))
(eval-after-load "company" (add-hook 'cider-repl-mode-hook #'company-mode))


;;; snippets for clojure

(leaf clojure-snippets
  :ensure t)


;;; keymaps

(add-hook 'cloure-mode-hook
          (lambda ()
            (defvar clojure-prefix-map (make-sparse-keymap))
            (evil-leader/set-key-for-mode "<SPC>" 'clojure-mode
              clojure-prefix-map)
            ;; repl
            (define-key clojure-prefix-map "cc" 'cider-eval-region)
            (define-key clojure-prefix-map "cf" 'cider-eval-buffer)
            ;; debug
            (define-key clojure-prefix-map "dr" 'cider-eval-defun-at-point)))


(provide 'init-clojure)
;;; init-clojure.el ends here

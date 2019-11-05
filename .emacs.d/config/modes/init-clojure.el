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

(eval-after-load "company"
  (progn (add-hook 'cider-mode-hook #'company-mode)
         (add-hook 'cider-repl-mode-hook #'company-mode)))


;;; snippets for clojure

(leaf clojure-snippets
  :ensure t)


;;; keymap

(defvar clojure-prefix-map
  (let ((map (make-sparse-keymap)))
    ;; repl
    (define-key map "cc" 'cider-eval-region)
    (define-key map "cf" 'cider-eval-buffer)
    ;; debug
    (define-key map "dr" 'cider-eval-defun-at-point)
    map))

(add-hook 'cloure-mode-hook
          (lambda ()
            (evil-leader/set-key-for-mode 'clojure-mode
              "<SPC>" clojure-prefix-map)))


;;; init-clojure.el ends here

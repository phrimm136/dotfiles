;;; package --- summary:
;;; Commentary:
;;; Code:

;;; autostart

(leaf clojure-mode
  :straight t
  :hook (clojure-mode-hook . cider-jack-in))


;;; colorful parenthesis

(leaf rainbow-delimiters
  :straight t
  :hook (clojure-mode-hook . rainbow-delimiters-mode))


;;; clojure language server

(with-eval-after-load "lsp"
  (add-to-list 'lsp-language-id-configuration '(clojure-mode . "clojure-mode")))


;;; linter

(leaf flycheck-clojure
  :straight t
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
  :straight t)


;;; keymap

(defvar custom-clojure-repl-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "c" 'cider-eval-region)
    (define-key map "f" 'cider-eval-buffer)
    map))
(defalias 'clojure-repl custom-clojure-repl-keymap)

(defvar custom-clojure-debug-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "r" 'cider-eval-defun-at-point)
    map))
(defalias 'clojure-debug custom-clojure-debug-keymap)

(defvar custom-clojure-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "c" 'clojure-repl)
    (define-key map "d" 'clojure-debug)
    map))
(defalias 'clojure custom-clojure-keymap)

(evil-leader/set-key-for-mode 'clojure-mode
  "<SPC>" 'clojure)


;;; init-clojure.el ends here

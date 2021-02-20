;;; init-clojure.el --- configuration for clojure language -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:


;;; autostart

(leaf clojure-mode
  :straight t
  :setq ((clojure-indent-style . 'align-arguments)))


;;; clojure language server

;; (leaf lsp-clojure
;;   :after lsp-mode)


;;; cider - homeland of clojure

(leaf cider
  :straight t
  :hook ((cider-mode-hook . cider-enlighten-mode))
  :setq ((cider-show-error-buffer . nil)
         (cider-save-file-on-load . nil)
         (cider-repl-pop-to-buffer-on-connect . 'display-only)
         (cider-repl-warp-history . t)
         (nrepl-log-messages . t)))


;;; linter

(leaf flycheck-clojure
  :straight t
  :hook (cider-mode-hook . (lambda ()
                             (setq next-error-function #'flycheck-next-error-function)))
  :config (progn (flycheck-clojure-setup)))


;;; auto completion

(eval-after-load "company"
  (progn (add-hook 'cider-mode-hook #'company-mode)
         (add-hook 'cider-repl-mode-hook #'company-mode)))


;;; snippets for clojure

(leaf clojure-snippets
  :straight t)


;;; keymap

(defvar cider-toggle-map
  (let ((map (make-sparse-keymap)))
    (define-key map "v" 'cider-toggle-trace-var)
    (define-key map "n" 'cider-toggle-trace-ns)
    map))

(defvar cider-find-map
  (let ((map (make-sparse-keymap)))
    (define-key map "f" 'cider-find-file)
    (define-key map "v" 'cider-find-var)
    (define-key map "d" 'cider-find-dwim)
    (define-key map "r" 'cider-find-resource)
    (define-key map "n" 'cider-find-ns)
    map))

(defvar cider-xref-map
  (let ((map (make-sparse-keymap)))
    (define-key map "r" 'cider-xref-fn-refs)
    (define-key map "R" 'cider-xref-fn-refs-select)
    (define-key map "d" 'cider-xref-fn-deps)
    (define-key map "D" 'cider-xref-fn-deps-select)
    map))

(defvar custom-clojure-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "e" 'cider-eval-commands-map)
    (define-key map "E" 'cider-eval-last-sexp)
    (define-key map "d" 'cider-doc-map)
    (define-key map "d" 'cider-describe-connection)
    (define-key map "c" 'cider)
    (define-key map "q" 'cider-quit)
    (define-key map "r" 'cider-restart)
    (define-key map "R" 'clojure-refactor-map)
    (define-key map "i" 'cider-interrupt)
    (define-key map "m" 'cider-macroexpand-1)
    (define-key map "M" 'cider-macroexpand-all)
    (define-key map "n" 'cider-repl-set-ns)
    (define-key map "N" 'cider-ns-map)
    (define-key map "b" 'cider-switch-to-repl-buffer)
    (define-key map "o" 'cider-find-and-clear-repl-output)
    (define-key map "k" 'cider-load-buffer)
    (define-key map "l" 'cider-load-file)
    (define-key map "L" 'cider-load-all-files)
    (define-key map "t" 'cider-test-commands-map)
    (define-key map "T" 'cider-toggle-map)
    (define-key map "u" 'cider-undef)
    (define-key map "f" 'cider-find-map)
    (define-key map "x" 'cider-xref-map)
    (define-key map "," 'cider-pop-back)
    (define-key map "s" 'sesman-map)
    (define-key map "S" 'cider-selector)
    (define-key map "h" 'cider-repl-history)
    map))
(defalias 'clojure custom-clojure-keymap)

(evil-leader/set-key-for-mode 'clojure-mode
  "<SPC>" 'clojure)
(evil-leader/set-key-for-mode 'cider-repl-mode
  "<SPC>" 'clojure)


;;; init-clojure.el ends here

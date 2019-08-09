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


;;; linter

(leaf flycheck-clojure
  :ensure t
  :after flycheck clojure-mode
  :config (progn (flycheck-clojure-setup)))

(add-hook 'cider-mode-hook (lambda ()
                             (setq next-error-function #'flycheck-next-error-function)))


;;; auto completion

(eval-after-load "company" (add-hook 'cider-mode-hook #'company-mode))
(eval-after-load "company" (add-hook 'cider-repl-mode-hook #'company-mode))


;;;

;;; package --- summary:
;;; Commentary:
;;; Code:


;;; color numerics

(leaf highlight-numbers
  :ensure t
  :hook ((prog-mode-hook org-mode-hook) . highlight-numbers-mode))


;;; color color hex

(leaf rainbow-mode
  :ensure t
  :hook (emacs-lisp-mode-hook . rainbow-mode)
  :setq ((rainbow-x-colors . nil)))


;;; highlight current line

(leaf hl-line
  :ensure t
  :config (progn (global-hl-line-mode t)))


;;; init-highlight.el ends here

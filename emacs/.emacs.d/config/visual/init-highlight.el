;;; init-highlight.el --- configuration for highlighting specific text format

;;; Commentary:

;;; Code:


;;; color numerics

(leaf highlight-numbers
  :straight t
  :hook ((prog-mode-hook org-mode-hook) . highlight-numbers-mode))


;;; colorize color hex

(leaf rainbow-mode
  :straight t
  :hook (emacs-lisp-mode-hook . rainbow-mode))


;;; highlight current line

(leaf hl-line
  :config (progn (global-hl-line-mode t)))


;;; colorful parenthesis

(leaf rainbow-delimiters
  :straight t
  :hook ((prog-mode-hook org-mode-hook) . rainbow-delimiters-mode))


;;; init-highlight.el ends here

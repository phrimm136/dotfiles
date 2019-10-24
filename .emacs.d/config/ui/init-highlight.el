;;; package --- summary:
;;; Commentary:
;;; Code:


;;; color numerics

(leaf highlight-numbers
  :ensure t
  :hook ((prog-mode-hook org-mode-hook) . highlight-numbers-mode))


;;; highlight current line

(leaf hl-line
  :ensure t
  :config (progn (global-hl-line-mode t)))

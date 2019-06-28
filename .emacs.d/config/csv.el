;;; package --- summary:
;;; Commentary:
;;; Code:


(use-package csv-mode
  :ensure t
  :config (progn (add-hook csv-mode-hook (lambda () (display-line-numbers-mode 0)))))


;;;

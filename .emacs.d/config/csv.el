;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf csv-mode
  :ensure t
  :config (progn (add-hook csv-mode-hook (lambda () (display-line-numbers-mode 0)))))


;;;

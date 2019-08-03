;;; package --- summary:
;;; Commentary:
;;; Code:


;;; pdf-tools config

(leaf pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config (progn (display-line-numbers-mode 0)
                 (undo-tree-mode 0)))


;;; pdf.el ends here

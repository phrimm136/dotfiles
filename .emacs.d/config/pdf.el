;;; package --- summary:
;;; Commentary:
;;; Code:


;;; pdf-tools config

(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config (progn (add-hook 'pdf-view-mode-hook (lambda ()
                                                 (display-line-numbers-mode 0)
                                                 (undo-tree-mode 0)
                                                 (company-mode 0)))))


;;;

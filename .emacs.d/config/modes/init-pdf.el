;;; package --- summary:
;;; Commentary:
;;; Code:


;;; pdf-tools config

(leaf pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config (progn (evil-set-initial-state 'pdf-view-mode 'normal)
                 (evil-leader/set-key-for-mode 'pdf-view-mode
                   "p" 'pdf-view-goto-page)))


(provide 'init-pdf)
;;; pdf.el ends here

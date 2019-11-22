;;; package --- summary:
;;; Commentary:
;;; Code:


;;; pdf viewer

(leaf pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config (progn (evil-set-initial-state 'pdf-view-mode 'normal)))


;;; keymap

(defvar custom-pdf-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "p" 'pdf-view-goto-page)
    map))
(defalias 'custom-pdf-prefix custom-pdf-keymap)

(evil-leader/set-key-for-mode 'pdf-view-mode
  "<SPC>" 'custom-pdf-prefix)


;;; init-pdf.el ends here

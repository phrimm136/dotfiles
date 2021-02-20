;;; init-pdf.el --- configuration for pdf format -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:


;;; pdf viewer

(leaf pdf-tools
  :straight t
  :mode (("\\.pdf\\'" . pdf-view-mode))
  :config (progn (evil-set-initial-state 'pdf-view-mode 'normal)))


;;; keymap

(defvar custom-pdf-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "p" 'pdf-view-goto-page)
    map))
(defalias 'pdf custom-pdf-keymap)

(evil-leader/set-key-for-mode 'pdf-view-mode
  "<SPC>" 'pdf)


;;; init-pdf.el ends here

;;; init-pdf.el --- configuration for pdf format -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; sync pdf

(push '(".*\\.pdf" . (nil (reusable-frames . t)
                          (inhibit-switch-frame . t)))
      display-buffer-alist)


;;; pdf viewer

(leaf pdf-tools
  :straight t
  :mode (("\\.pdf\\'" . pdf-view-mode))
  :config (progn (evil-set-initial-state 'pdf-view-mode 'normal)))


;;; persistent page

(leaf saveplace-pdf-view
  :straight t
  :config (save-place-mode 1))


;;; keymap

(defvar custom-pdf-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "p" 'pdf-view-goto-page)
    map))
(defalias 'pdf custom-pdf-keymap)

(evil-leader/set-key-for-mode 'pdf-view-mode
  "<SPC>" 'pdf)


(provide 'init-pdf)

;;; init-pdf.el ends here

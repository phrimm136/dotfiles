;;; package --- summary:
;;; Commentary:
;;; Code:


;;; pdf viewer

(leaf pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config (progn (evil-set-initial-state 'pdf-view-mode 'normal)))


;;; keymap

(defvar pdf-prefix-map
  (let ((map (make-sparse-keymap)))
    (define-key map "p" 'pdf-view-goto-page)
    map))

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (evil-leader/set-key-for-mode 'pdf-view-mode
              "<SPC>" pdf-prefix-map)))


;;; init-pdf.el ends here

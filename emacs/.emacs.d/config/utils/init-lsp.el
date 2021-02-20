;;; init-lsp.el --- configuration for lsp -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf lsp-mode
  :straight t
  :hook ((prog-mode-hook . lsp-deferred))
  :setq ((lsp-enable-semantic-highlighting . t)
         (lsp-keep-workspace-alive . nil)
         (lsp-prefer-flymake . nil)
         (lsp-auto-configure . nil)
         (lsp-enable-indentation . nil)
         (lsp-eldoc-render-all . nil)
         (lsp-log-io . nil)
         (lsp-json-use-lists . nil)
         (lsp-signature-auto-activate . nil)))


;;; ui

(leaf lsp-ui
  :straight t
  :hook ((lsp-mode-hook . lsp-ui-mode)
         (lsp-ui-imenu-mode-hook . (lambda ()
                                     (with-current-buffer "*lsp-ui-imenu*"
                                       (setq-local face-remapping-alist
                                                   `((default . (:background "#181818"))))))))
  :setq ((lsp-ui-doc-enable . nil)
         (lsp-ui-doc-header . nil)
         (lsp-ui-doc-delay . 0.1)
         (lsp-ui-doc-position . 'at-point)
         (lsp-ui-doc-border . "black")
         (lsp-ui-doc-use-childframe . t)
         (lsp-ui-doc-include-signature . t)
         (lsp-ui-peek-enable . t)
         (lsp-ui-peek-always-show . nil)
         (lsp-ui-peek-fontify . 'on-demand)
         (lsp-ui-sideline-enable . t)
         (lsp-ui-sideline-show-hover . t)
         (lsp-ui-sideline-update-mode . 'line)
         (lsp-ui-sideline-show-diagnostics . t)
         (lsp-ui-sideline-display . 0.5)
         (lsp-ui-flycheck-enable . t)
         (lsp-ui-imenu-kind-position . 'left))
  :bind ((:lsp-ui-peek-mode-map
          ("C-j" . lsp-ui-peek--select-next)
          ("C-k" . lsp-ui-peek--select-prev)
          ("C-h" . lsp-ui-peek--select-prev-file)
          ("C-l" . lsp-ui-peek--select-next-file))))


(leaf lsp-ivy
  :straight (lsp-ivy :type git
                     :host github
                     :repo "emacs-lsp/lsp-ivy"))


;;; keymap

(defvar custom-lsp-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "l" 'lsp)
    (define-key map "r" 'lsp-restart-workspace)
    (define-key map "s" 'lsp-shutdown-workspace)
    (define-key map "w" 'lsp-describe-thing-at-point)
    (define-key map "e" 'lsp-execute-code-action)
    (define-key map "n" 'lsp-rename)
    (define-key map "h" 'lsp-ui-doc-glance)
    (define-key map "fr" 'lsp-ui-peek-find-references)
    (define-key map "fd" 'lsp-ui-peek-find-definitions)
    (define-key map "fi" 'lsp-ui-peek-find-implementation)
    (define-key map "fs" 'lsp-ui-peek-find-workspace-symbol)
    (define-key map "\t" 'lsp-ui-imenu)
    map))
(defalias 'language-server custom-lsp-keymap)

(evil-leader/set-key
  "l" 'language-server)


;;; init-lsp.el ends here

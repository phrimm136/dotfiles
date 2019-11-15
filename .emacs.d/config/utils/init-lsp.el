;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf lsp-mode
  :ensure t
  :leaf-defer nil
  :after flycheck eldoc
  :hook ((prog-mode-hook . lsp-deferred))
  :setq ((lsp-enable-semantic-highlighting . nil)
         (lsp-keep-workspace-alive . nil)
         (lsp-enable-snippet . t)
         (lsp-prefer-flymake . nil)
         (lsp-log-io . nil)
         (lsp-json-use-lists . nil)
         (lsp-enable-indentation . nil)
         (lsp-enable-on-type-formatting . nil)))


;;; ui

(leaf lsp-ui
  :ensure t
  :leaf-defer nil
  :after lsp-mode
  :hook (lsp-mode-hook . lsp-ui-mode)
  :setq ((lsp-ui-doc-enable . nil)
         (lsp-ui-doc-header . t)
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
         (lsp-ui-sideline-show-diagnostics . t)
         (lsp-ui-flycheck-enable . t)
         (lsp-ui-imenu-kind-position . 'left))
  :bind ((:lsp-ui-peek-mode-map
          ("C-j" . lsp-ui-peek--select-next)
          ("C-k" . lsp-ui-peek--select-prev)
          ("C-h" . lsp-ui-peek--select-prev-file)
          ("C-l" . lsp-ui-peek--select-next-file))))


(with-eval-after-load "lsp-mode"
  (quelpa `(lsp-ivy :fetcher github
                    :repo "emacs-lsp/lsp-ivy")))


;;; keymap

(defvar lsp-custom-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "l" 'lsp)
    (define-key map "r" 'lsp-restart-workspace)
    (define-key map "s" 'lsp-shutdown-workspace)
    (define-key map "w" 'lsp-describe-thing-at-point)
    (define-key map "e" 'lsp-execute-code-action)
    (define-key map "n" 'lsp-rename)
    (define-key map "fr" 'lsp-ui-peek-find-references)
    (define-key map "fd" 'lsp-ui-peek-find-definitions)
    (define-key map "fi" 'lsp-ui-peek-find-implementation)
    (define-key map "fs" 'lsp-ui-peek-find-workspace-symbol)
    (define-key map "e" 'lsp-ui-flycheck-list)
    map))
(defalias 'lsp-custom-prefix lsp-custom-keymap)

(evil-leader/set-key
  "l" 'lsp-custom-prefix)


;;; init-lsp.el ends here

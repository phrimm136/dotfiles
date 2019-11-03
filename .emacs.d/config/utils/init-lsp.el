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
         (lsp-enable-on-type-formatting . nil))
  :config (progn (evil-leader/set-key
                   "ll" 'lsp
                   "lr" 'lsp-restart-workspace
                   "ls" 'lsp-shutdown-workspace
                   "lw" 'lsp-describe-thing-at-point
                   "le" 'lsp-execute-code-action
                   "ln" 'lsp-rename)))


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
  :config (progn (evil-leader/set-key
                   "lfr" 'lsp-ui-peek-find-references
                   "lfd" 'lsp-ui-peek-find-definitions
                   "lfi" 'lsp-ui-peek-find-implementation
                   "lfs" 'lsp-ui-peek-find-workspace-symbol
                   "le" 'lsp-ui-flycheck-list))
  :bind ((:lsp-ui-peek-mode-map
          ("C-j" . lsp-ui-peek--select-next)
          ("C-k" . lsp-ui-peek--select-prev)
          ("C-h" . lsp-ui-peek--select-prev-file)
          ("C-l" . lsp-ui-peek--select-next-file))))


(with-eval-after-load "lsp-mode"
  (quelpa `(lsp-ivy :fetcher github
                    :repo "emacs-lsp/lsp-ivy")))


;;; init-lsp.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf dap-mode
  :straight t
  :hook (lsp-mode . (dap-mode dap-ui-mode dap-tooltip-mode))
  :config (progn (dap-mode 1)
                 (dap-ui-mode 1)
                 (dap-tooltip-mode 1)
                 (evil-leader/set-key
                   "ldba" 'dap-breakpoint-add
                   "ldbd" 'dap-breakpoint-delete
                   "ldbD" 'dap-breakpoint-delete-all
                   "ldbt" 'dap-breakpoint-toggle)))


;;; init-dap.el ends here

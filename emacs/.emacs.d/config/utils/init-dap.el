;;; init-dap.el --- configuration for dap -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf dap-mode
  :straight t
  :hook (lsp-mode . (dap-mode dap-ui-mode dap-tooltip-mode))
  :config (progn (evil-leader/set-key
                   "ldba" 'dap-breakpoint-add
                   "ldbd" 'dap-breakpoint-delete
                   "ldbD" 'dap-breakpoint-delete-all
                   "ldbt" 'dap-breakpoint-toggle)))


;;; init-dap.el ends here

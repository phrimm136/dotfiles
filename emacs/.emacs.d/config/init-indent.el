;;; init-indent.el --- configuration for indentation -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf aggressive-indent
  :straight t
  :hook ((prog-mode-hook) . aggressive-indent-mode))


(provide 'init-indent)

;;; init-indent.el ends here

;;; init-aggressive-indent.el --- configuration for agressive-indent -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf aggressive-indent
  :straight t
  :hook ((prog-mode-hook) . aggressive-indent-mode))


;;; init-aggressive-indent.el ends here

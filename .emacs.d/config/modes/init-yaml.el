;;; package --- summary:
;;; Commentary:
;;; Code:


;;; yaml mode

(leaf yaml-mode
  :ensure t
  :hook (yaml-mode-hook . display-line-numbers-mode))


;;; language server

(leaf lsp-yaml
  :after lsp)


;;; init-yaml.el ends here

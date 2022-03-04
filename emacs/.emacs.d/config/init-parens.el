;;; init-parens.el --- configuration for parenthesis -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; show matching parenthesis

(leaf paren
  :setq ((show-paren-style . 'parenthesis))
  :config (progn (show-paren-mode 1)))


;;; smartparens

(leaf smartparens
  :straight t
  :init (require 'smartparens-config)
  :setq ((sp-ignore-modes-list . '())
         (sp-escape-quotes-after-insert . nil))
  :config (progn (smartparens-global-strict-mode)
                 (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)))


;;; evil-mode integration

(leaf evil-smartparens
  :straight t
  :after smartparens
  :hook ((smartparens-enabled-hook . evil-smartparens-mode)))


;;; keymap



(provide 'init-parens)

;;; init-parens.el ends here

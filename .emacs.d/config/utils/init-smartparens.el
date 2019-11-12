;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf smartparens
  :ensure t
  :init (require 'smartparens-config)
  :config (progn (smartparens-global-strict-mode)
                 (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
                 (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
                 (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)))



;;; init-smartparens.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf smartparens
  :ensure t
  :leaf-defer nil
  :config (progn (smartparens-global-strict-mode 1)
                 (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
                 (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
                 (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)))



;;; init-smartparens.el ends here

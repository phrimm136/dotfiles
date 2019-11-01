;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf smartparens
  :ensure t
  :hook ((prog-mode-hook org-mode-hook text-mode-hook) . smartparens-strict-mode)
  :config (progn (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
                 (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
                 (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)))



;;; init-smartparens.el ends here

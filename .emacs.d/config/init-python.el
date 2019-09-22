;;; package --- summary:
;;; Commentary:
;;; Code:


;;; auto completion

(leaf company-jedi
  :ensure t
  :after company jedi
  :init (progn (add-hook 'python-mode-hook
                         (lambda ()
                           (add-to-list (make-local-variable 'company-backends)
                                        '(company-jedi))))))


;;; python language server

(lsp-register-client (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                                      :major-modes '(python-mode)
                                      :server-id 'pyls))


;;; virtual environment

(leaf virtualenvwrapper
  :ensure t)

(leaf auto-virtualenvwrapper
  :ensure t
  :after virtualenvwrapper
  :config (progn (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)))


;; keymaps

(add-hook 'python-mode-hook
          (lambda ()
            (defvar python-prefix-map (make-sparse-keymap))
            (evil-leader/set-key-for-mode 'python-mode
              "<SPC>" python-prefix-map)
            ;; repl
            (define-key python-prefix-map "cc" 'python-shell-send-region)
            (define-key python-prefix-map "cf" 'python-shell-send-buffer)))


(provide 'init-python)
;;; python.el ends here

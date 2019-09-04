;;; package --- summary:
;;; Commentary:
;;; Code:


;;; jedi

(leaf jedi
  :ensure t
  :config (progn (add-hook 'python-mode-hook
                           (lambda ()
                             (jedi:setup)
                             (run-python)
                             (setq tab-width 4)))))


;;; auto completion

(leaf company-jedi
  :ensure t
  :after company jedi
  :init (progn (add-hook 'python-mode-hook
                         (lambda ()
                           (add-to-list (make-local-variable 'company-backends)
                                        '(company-jedi))))))


;;; virtual environment

(leaf virtualenvwrapper
  :ensure t)

(leaf auto-virtualenvwrapper
  :ensure t
  :after virtualenvwrapper
  :config (progn (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)))


(provide 'init-python)
;;; python.el ends here

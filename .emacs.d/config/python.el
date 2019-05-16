;(add-to-list 'auto-mode-alist '("\\.py\\" . python-mode))


;;; python style

(add-hook 'python-mode-hook 'highlight-numbers-mode)


;;; jedi config

(use-package company-jedi
  :ensure t
  :init (progn (add-hook 'python-mode-hook (lambda ()
					     (add-to-list 'company-backends 'company-jedi)))
	       (add-hook 'python-mode-hook 'jedi-mode))
  :config (progn (add-hook 'python-mode-hook 'run-python)
		 (add-hook 'python-mode-hook (lambda ()
					       (setq tab-width 4)))))


;;; virtualenvwrapper config

(use-package virtualenvwrapper
  :ensure t)

(use-package auto-virtualenvwrapper
  :ensure t
  :config (progn (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)))


;;; eldoc config

(use-package eldoc
  :ensure t
  :config (progn (add-hook 'python-mode-hook 'eldoc-mode)))


;;;

;;; package --- summary:
;;; Commentary:
;;; Code:

;;; color number

(add-hook 'python-mode-hook 'highlight-numbers-mode)


;;; jedi

(leaf jedi
  :ensure t
  :config (progn (add-hook 'python-mode-hook 'jedi:setup)
                 (add-hook 'python-mode-hook 'run-python)
                 (add-hook 'python-mode-hook (lambda ()
                                               (setq tab-width 4)))))

(leaf company-jedi
  :ensure t
  :init (progn (add-hook 'python-mode-hook (lambda ()
					     (add-to-list 'company-backends 'company-jedi)))))


;;; virtual environment

(leaf virtualenvwrapper
  :ensure t)

(leaf auto-virtualenvwrapper
  :ensure t
  :config (progn (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)))


;;;

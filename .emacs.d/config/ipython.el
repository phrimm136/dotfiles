;;; Code:


;;; hook

(add-to-list 'auto-mode-alist '("\\.ipynb\\'") 'ein:ipynb-mode-hook)


;;; ein config

(use-package ein
  :ensure t
  :init (setq ein:completion-backend 'ein:use-company-backend)
  :config (progn (add-hook 'ein:ipynb-mode-hook (lambda ()
						  (let ((buffer (current-buffer)))
						    (ein:jupyter-server-start (concat (file-name-directory buffer-file-name)
										      "venv/bin/jupyter")
									      (file-name-directory buffer-file-name)
									      nil
									      '(lambda (buffer url-or-port)
										 (pop-to-buffer buffer)))
						    (ein:notebook-open "http://127.0.0.1:8888"
								       (buffer-name))
						    (kill-buffer buffer))))))

(use-package ein-notebook)

(use-package ein-subpackages)


;;; jedi config

(use-package jedi
  :ensure t
  :config (progn (add-hook 'ein:connect-mode-hook 'ein:jedi-setup)))


;;;


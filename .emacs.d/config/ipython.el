;;; package --- summary:
;;; Commentary:
;;; Code:


;;; ein config

(use-package ein
  :ensure t
  :init (setq ein:completion-backend 'ein:use-company-backend)
  :mode ("\\.ipynb\\'" . 'ein:ipynb-mode-hook)
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
                                                    (kill-buffer buffer))))
                 (undo-tree-mode nil)
                 (flycheck-mode nil)))

(use-package ein-notebook)

(use-package ein-subpackages)


;;; jedi config

(use-package jedi
  :ensure t
  :config (progn (add-hook 'ein:connect-mode-hook 'ein:jedi-setup)))


;;;

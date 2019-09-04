;;; package --- summary:
;;; Commentary:
;;; Code:


;;; ein config

(leaf ein
  :ensure t
  :config (progn (add-hook 'ein:notebook-mode-hook
                           (add-to-list (make-local-variable 'company-backends) '(ein:company-backend)))
                 (add-hook 'ein:ipynb-mode-hook
                           (lambda ()
                             (let ((buffer (current-buffer))
                                   (virtualenv (concat (file-name-directory buffer-file-name)
                                                       "venv/bin/jupyter")))
                               (ein:jupyter-server-start (if (file-exists-p virtualenv)
                                                             virtualenv
                                                           "/usr/bin/jupyter")
                                                         (file-name-directory buffer-file-name)
                                                         nil
                                                         '(lambda (buffer url-or-port)
                                                            (pop-to-buffer buffer)))
                               (ein:notebook-open "http://127.0.0.1:8888"
                                                  (buffer-name))
                               (kill-buffer buffer))))))


;;; jedi config

(leaf jedi
  :ensure t
  :after ein
  :hook (ein:connect-mode-hook . ein:jedi-setup))


(provide 'init-ipython)
;;; init-ipython.el ends here

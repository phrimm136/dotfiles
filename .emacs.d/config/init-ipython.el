;;; package --- summary:
;;; Commentary:
;;; Code:


;;; ein config

(leaf ein
  :ensure t
  :config (progn (dolist (notebook '(ein:notebook-multilang-mode-hook ein:notebook-python-mode-hook))
                   (add-hook notebook
                             (lambda ()
                               (add-to-list (make-local-variable 'company-backends)
                                            '(ein:company-backend)))))
                 (setq ein:default-url-or-port "http://127.0.0.1:8888")
                 ;; auto start ein when opening notebooks
                 (add-hook 'ein:ipynb-mode-hook
                           (lambda ()
                             (let ((buffer (current-buffer))
                                   (virtualenv (concat (file-name-directory buffer-file-name)
                                                       "venv/bin/jupyter")))
                               (unless (ein:jupyter-server-process)
                                 (ein:jupyter-server-start (if (file-exists-p virtualenv)
                                                               virtualenv
                                                             "/usr/bin/jupyter")
                                                           (file-name-directory buffer-file-name)
                                                           nil
                                                           '(lambda (buffer url-or-port)
                                                              (pop-to-buffer buffer))))
                               (ein:notebook-open ein:default-url-or-port
                                                  (buffer-name))
                               (kill-buffer buffer)
                               (delete 'ein:company-backend 'company-backends) ; prevent from duplicate backends and breaking locality
                               )))))


;;; jedi config

(leaf jedi
  :ensure t
  :after ein
  :hook (ein:connect-mode-hook . ein:jedi-setup))


;;; keymaps

(dolist (notebook '(ein:notebook-multilang-mode-hook ein:notebook-python-mode-hook))
  (add-hook notebook
            (lambda ()
              (evil-define-key 'normal ein:notebook-mode-map
                "gg" 'evil-goto-first-line ; bug on default setting
                )
              (defvar ipython-prefix-map (make-sparse-keymap))
              (evil-leader/set-key "<SPC>" ipython-prefix-map))))


(provide 'init-ipython)
;;; init-ipython.el ends here

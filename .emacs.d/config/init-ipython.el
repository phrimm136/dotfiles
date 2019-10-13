;;; package --- summary:
;;; Commentary:
;;; Code:


;;; ein config

(leaf ein
  :ensure t
  :config (progn (delete 'ein:company-backend company-backends) ; prevent from duplicate backends and breaking locality
                 (dolist (notebook '(ein:notebook-multilang-mode-hook ein:notebook-python-mode-hook))
                   (add-hook notebook
                             (lambda ()
                               (add-to-list (make-local-variable 'company-backends)
                                            'ein:company-backend))))
                 (setq ein:default-url-or-port "http://127.0.0.1:8888"
                       ein:worksheet-enable-undo t)
                 ;; auto start ein when opening notebooks
                 (defun ein:run-with-file-open ()
                   (let ((buffer (current-buffer))
                         (venv (concat (file-name-directory buffer-file-name)
                                       "venv/bin/jupyter")))
                     (if (ein:jupyter-server-process)
                         (error "Please first M-x ein:stop"))
                     (ein:jupyter-server-start (if (file-exists-p venv)
                                                   venv
                                                 "/usr/bin/jupyter")
                                               (file-name-directory buffer-file-name)
                                               nil)
                     (ein:notebook-open ein:default-url-or-port
                                        (buffer-name)
                                        (ein:get-kernelspec ein:default-url-or-port
                                                            buffer-file-name))
                     (kill-buffer buffer)))
                 (add-hook 'ein:ipynb-mode-hook 'ein:run-with-file-open)))


;;; jedi config

(leaf jedi
  :ensure t
  :after ein
  :hook (ein:connect-mode-hook . ein:jedi-setup))


;;; keymaps

(defvar ipython-prefix-map (make-sparse-keymap))

(dolist (notebook '(ein:notebook-multilang-mode-hook ein:notebook-python-mode-hook))
  (add-hook notebook
            (lambda ()
              (evil-define-key 'normal ein:notebook-mode-map
                "gg" 'evil-goto-first-line ; bug on default setting
                )
              (evil-leader/set-key "<SPC>" ipython-prefix-map))))


(provide 'init-ipython)
;;; init-ipython.el ends here

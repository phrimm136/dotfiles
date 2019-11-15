;;; package --- summary:
;;; Commentary:
;;; Code:


;;; ein config

(leaf ein
  :ensure t
  :config (progn (require 'ein-timestamp)
                 (dolist (notebook '(ein:notebook-multilang-mode-hook ein:notebook-python-mode-hook))
                   (add-hook notebook
                             (lambda ()
                               (add-to-list (make-local-variable 'company-backends)
                                            'ein:company-backend))))
                 (setq ein:default-url-or-port "http://127.0.0.1:8888"
                       ein:worksheet-enable-undo t
                       ein:completion-backend 'ein:use-none-backend
                       ein:jupyter-server-use-subcommand "lab")
                 ;; auto start ein when opening notebooks
                 (defun ein:run-with-file-open ()
                   (let ((buffer (current-buffer))
                         (venv (concat (file-name-directory buffer-file-name)
                                       "venv/bin/jupyter")))
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
                 (add-hook 'ein:ipynb-mode-hook 'ein:run-with-file-open)
                 (delete 'ein:company-backend company-backends) ; prevent from duplicate backends and breaking locality
                 ))


;;; connect language server to jupyter notebook

(add-to-list 'lsp-language-id-configuration '(ein:notebook-python-mode . "ein:notebook-python"))
(add-to-list 'lsp-language-id-configuration '(ein:notebook-multilang-mode . "ein:notebook-multilang"))
(lsp-register-client (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                                      :major-modes '(ein:notebook-python-mode ein:notebook-multilang-mode python-mode)
                                      :server-id 'pyls))


;;; keymap

(defvar jupyter-custom-keymap
  (let ((map (make-sparse-keymap)))
    map))
(defalias 'jupyter-custom-prefix jupyter-custom-keymap)

(dolist (notebook '(ein:notebook-multilang-mode-hook ein:notebook-python-mode-hook))
  (add-hook notebook
            (lambda ()
              (evil-define-key 'normal ein:notebook-mode-map
                "gg" 'evil-goto-first-line ; bug on default setting
                )))
  (evil-leader/set-key-for-mode notebook
    "<SPC>" 'jupyter-custom-prefix))


;;; init-jupyter.el ends here

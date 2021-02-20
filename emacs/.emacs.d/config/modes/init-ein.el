;;; init-ein.el --- configuration for jupyter notebook with ein -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; ein config

(leaf ein
  :straight t
  :config (progn (dolist (notebook '(ein:notebook-multilang-mode-hook ein:notebook-python-mode-hook))
                   (add-hook notebook
                             (lambda ()
                               (add-to-list (make-local-variable 'company-backends)
                                            'ein:company-backend))))
                 (setq ein:default-url-or-port "http://127.0.0.1:8888"
                       ein:worksheet-enable-undo t
                       ein:completion-backend 'ein:use-none-backend
                       ein:jupyter-server-use-subcommand "lab"
                       ein:output-area-inlined-images t)
                 ;; auto start ein when opening notebooks
                 (defun ein:run-with-file-open ()
                   (ein:jupyter-server-start "/usr/bin/jupyter"
                                             (file-name-directory buffer-file-name)
                                             nil)
                   (ein:notebook-open ein:default-url-or-port
                                      (buffer-name)
                                      (ein:get-kernelspec ein:default-url-or-port
                                                          buffer-file-name))
                   (kill-buffer buffer))
                 (add-hook 'ein:ipynb-mode-hook 'ein:run-with-file-open)
                 (delete 'ein:company-backend company-backends) ; prevent from duplicate backends and breaking locality
                 ))


;;; connect language server to jupyter-notebook

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(ein:notebook-python-mode . "ein:notebook-python"))
  (add-to-list 'lsp-language-id-configuration '(ein:notebook-multilang-mode . "ein:notebook-multilang"))
  (lsp-register-client (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                                        :major-modes '(ein:notebook-python-mode ein:notebook-multilang-mode python-mode)
                                        :server-id 'pyls)))


;;; keymap

(defvar custom-ein:notebook-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "1" 'ein:notebook-worksheet-open-1th)
    (define-key map "2" 'ein:notebook-worksheet-open-2th)
    (define-key map "3" 'ein:notebook-worksheet-open-3th)
    (define-key map "4" 'ein:notebook-worksheet-open-4th)
    (define-key map "5" 'ein:notebook-worksheet-open-5th)
    (define-key map "6" 'ein:notebook-worksheet-open-6th)
    (define-key map "7" 'ein:notebook-worksheet-open-7th)
    (define-key map "8" 'ein:notebook-worksheet-open-8th)
    (define-key map "9" 'ein:notebook-worksheet-open-last)
    (define-key map "!" 'ein:worksheet-rename-sheet)
    (define-key map "#" 'ein:notebook-close)
    (define-key map "$" 'ein:tb-show)
    (define-key map "-" 'ein:notebook-worksheet-delete)
    (define-key map "+" 'ein:notebook-worksheet-insert-next)
    (define-key map "=" 'ein:notebook-worksheet-insert-prev)
    (define-key map "{" 'ein:notebook-worksheet-open-prev-or-last)
    (define-key map "}" 'ein:notebook-worksheet-open-next-or-first)
    (define-key map "[" 'ein:notebook-worksheet-move-prev)
    (define-key map "]" 'ein:notebook-worksheet-move-next)
    (define-key map ";" 'ein:shared-output-show-code-cell-at-point)
    (define-key map ":" 'ein:shared-output-show-code-cell)
    (define-key map "a" 'ein:worksheet-insert-cell-above)
    (define-key map "b" 'ein:worksheet-insert-cell-below)
    (define-key map "c" 'ein:worksheet-execute-cell)
    (define-key map "d" 'ein:worksheet-kill-cell)
    (define-key map "e" 'ein:worksheet-toggle-output)
    (define-key map "f" 'ein:file-open)
    (define-key map "h" 'ein:pytools-request-tooltip-or-help)
    (define-key map "l" 'ein:worksheet-clear-output)
    (define-key map "o" 'ein:notebook-open)
    (define-key map "p" 'ein:worksheet-yank-cell)
    (define-key map "q" 'ein:notebook-kill-kernel-then-close-command)
    (define-key map "r" 'ein:notebook-reconnect-session-command)
    (define-key map "s" 'ein:worksheet-split-cell-at-point)
    (define-key map "t" 'ein:worksheet-toggle-cell-type)
    (define-key map "u" 'ein:worksheet-change-cell-type)
    (define-key map "v" 'ein:worksheet-set-output-visibility-all)
    (define-key map "y" 'ein:worksheet-copy-cell)
    (define-key map "z" 'ein:notebook-kernel-interrupt-command)
    (define-key map (kbd "RET") 'ein:worksheet-merge-cell)
    map))
(defalias 'ein:notebook custom-ein:notebook-keymap)

(dolist (notebook '(ein:notebook-multilang-mode ein:notebook-python-mode))
  (evil-leader/set-key-for-mode notebook
    "<SPC>" 'ein:notebook))


(defvar custom-ein:notebooklist-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "o" 'ein:notebook-open)
    (define-key map "f" 'ein:file-open)
    (define-key map "r" 'ein:notebooklist-reload)
    (define-key map "d" 'ein:notebooklist-delete-notebook-ask)
    (define-key map "n" 'ein:notebooklist-new-notebook)))
(defalias 'ein:notebooklist custom-ein:notebooklist-keymap)

(evil-leader/set-key-for-mode 'ein:notebooklist-mode
  "<SPC>" 'ein:notebooklist)


(evil-define-key 'normal ein:notebook-mode-map
  "gg" 'evil-goto-first-line ; bug on default setting
  )


;;; init-ein.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


;;; python language server

(setq lsp-pyls-plugins-pylint-enabled nil)


;;; python debug adapter

(with-eval-after-load 'dap-mode
  (require 'dap-python))


;;; additional linters

(leaf flycheck-pycheckers
  :straight t
  :after flycheck
  :hook (python-mode-hook . flycheck-pycheckers-setup)
  :setq ((flycheck-pycheckers-checkers . '(bandit))))


;;; virtual environment

(leaf virtualenvwrapper
  :straight t
  :hook ((python-mode-hook . (lambda ()
                               (unless (eq buffer-file-name nil)
                                 (setq-local venv-location (directory-file-name buffer-file-name)))))))

(leaf auto-virtualenvwrapper
  :straight t
  :hook (python-mode-hook . auto-virtualenvwrapper-activate))


;;; pip in emacs

(leaf pippel
  :straight (pippel :files ("pippel.el" "pippel.py"))
  :config (progn ()))


;;; make editing requirements.txt convenient

(leaf pip-requirements
  :straight t)


;;; Stop spamming

(setq python-indent-guess-indent-offset nil)


;; keymaps

(defvar custom-python-repl-keymap
  (let ((map(make-sparse-keymap)))
    ;; repl
    (define-key map "r" 'python-shell-send-region)
    (define-key map "c" 'python-shell-send-buffer)
    map))
(defalias 'python-repl custom-python-repl-keymap)

(defvar custom-python-keymap
  (let ((map(make-sparse-keymap)))
    (define-key map "c" 'python-repl)
    (define-key map "r" 'run-python)
    map))
(defalias 'python custom-python-keymap)

(evil-leader/set-key-for-mode 'python-mode
  "<SPC>" 'python)


;;; init-python.el ends here

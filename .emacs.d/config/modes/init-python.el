;;; package --- summary:
;;; Commentary:
;;; Code:


;;; python language server

(setq lsp-pyls-plugins-pylint-enabled nil)


;;; python debug adapter

(require 'dap-python)


;;; additional linters

(leaf flycheck-pycheckers
  :ensure t
  :after flycheck
  :hook (python-mode-hook . flycheck-pycheckers-setup)
  :setq ((flycheck-pycheckers-checkers . '(bandit))))


;;; virtual environment

(leaf virtualenvwrapper
  :ensure t
  :setq ((venv-location . (directory-file-name buffer-file-name)))
  :config (progn (venv-initialize-interactive-shells)
                 (venv-initialize-eshell)))

(leaf auto-virtualenvwrapper
  :ensure t
  :after virtualenvwrapper
  :hook (python-mode-hook . auto-virtualenvwrapper-activate))


;;; pip in emacs

(leaf pippel
  :ensure t
  :config (progn ()))


;;; code style

(setq python-indent-offset 4
      python-indent-guess-indent-offset nil)


;; keymaps

(defvar python-repl-custom-keymap
  (let ((map(make-sparse-keymap)))
    ;; repl
    (define-key map "p" 'run-python)
    (define-key map "r" 'python-shell-send-region)
    (define-key map "c" 'python-shell-send-buffer)
    map))
(defalias 'python-repl-custom-prefix python-repl-custom-keymap)

(defvar python-custom-keymap
  (let ((map(make-sparse-keymap)))
    (define-key map "c" 'python-repl-custom-prefix)
    map))
(defalias 'python-custom-prefix python-custom-keymap)

(evil-leader/set-key-for-mode 'python-mode
  "<SPC>" 'python-custom-prefix)


;;; init-python.el ends here

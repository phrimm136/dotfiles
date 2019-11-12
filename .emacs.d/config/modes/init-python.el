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
  :ensure t)

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

(defvar python-prefix-map
  (let ((map(make-sparse-keymap)))
    ;; repl
    (define-key map "cp" 'run-python)
    (define-key map "cr" 'python-shell-send-region)
    (define-key map "cc" 'python-shell-send-buffer)
    map))

(add-hook 'python-mode-hook
          (lambda ()
            (evil-leader/set-key-for-mode 'python-mode
              "<SPC>" python-prefix-map)))


;;; init-python.el ends here

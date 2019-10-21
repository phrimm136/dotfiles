;;; package --- summary:
;;; Commentary:
;;; Code:


;;; auto completion

;; (leaf company-jedi
;;   :ensure t
;;   :after company jedi
;;   :init (progn (add-hook 'python-mode-hook
;;                          (lambda ()
;;                            (add-to-list (make-local-variable 'company-backends)
;;                                         'company-jedi)))))


;;; python language server


;;; python debug adapter

(require 'dap-python)


;;; virtual environment

(leaf virtualenvwrapper
  :ensure t)

(leaf auto-virtualenvwrapper
  :ensure t
  :after virtualenvwrapper
  :hook (python-mode-hook . auto-virtualenvwrapper-activate))


;;; package management in emacs

(leaf pippel
  :ensure t
  :config (progn ()))


;;; code style

(setq python-indent-offset 4
      python-indent-guess-indent-offset nil)


;; keymaps

(defvar python-prefix-map (make-sparse-keymap))
;; repl
(define-key python-prefix-map "cp" 'run-python)
(define-key python-prefix-map "cr" 'python-shell-send-region)
(define-key python-prefix-map "cc" 'python-shell-send-buffer)

(add-hook 'python-mode-hook
          (lambda ()
            (evil-leader/set-key-for-mode 'python-mode
              "<SPC>" python-prefix-map)))


(provide 'init-python)
;;; init-python.el ends here

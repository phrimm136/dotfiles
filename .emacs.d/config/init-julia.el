;;; package --- summary:
;;; Commentary:
;;; Code:


;;; ESS julia config

(leaf ess
  :init (require 'ess-site)
  ;;:hook (ess-julia-mode-hook . 'run-ess-julia)
  :config (progn (setq inferior-julia-program "/bin/julia")))


;;; auto compleion

;; (add-hook 'ess-julia-mode-hook
;;           (lambda ()
;;             (add-to-list (make-local-variable 'company-backends)
;;                          '(company-ess-julia-objects))
;;             (delete 'company-ess-julia-objects company-backends))) ;; breaks locality when using ess-use-company.


;;; linting

;; (leaf flycheck-julia
;;   :ensure t
;;   :after flycheck julia-mode
;;   :config (progn (flycheck-julia-setup)))


;;; julia language server

(quelpa '(lsp-julia :fetcher github
                    :repo "non-Jedi/lsp-julia"))
(leaf lsp-julia
  :ensure t
  :after lsp
  :init (require 'lsp-julia)
  :config (progn (setq lsp-julia-default-environment "~/.julia/environments/v1.2")
                 (add-to-list 'lsp-language-id-configuration '(ess-julia-mode . "ess-julia"))
                 (lsp-register-client (make-lsp-client :new-connection (lsp-stdio-connection 'lsp-julia--rls-command)
                                                       :major-modes '(ess-julia-mode)
                                                       :server-id 'julia-ls))))


;;; keymaps

(add-hook 'ess-julia-mode-hook
          (lambda ()
            (defvar julia-prefix-map (make-sparse-keymap))
            (evil-leader/set-key-for-mode 'ess-julia-mode
              "<SPC>" julia-prefix-map)
            ;; repl
            (define-key julia-prefix-map "cc" 'ess-eval-region)
            (define-key julia-prefix-map "cf" 'ess-eval-buffer)
            (define-key julia-prefix-map "cr" 'run-ess-julia)
            ;; debug
            (define-key julia-prefix-map "ds" 'ess-debug-start)
            (define-key julia-prefix-map "dS" 'ess-debug-stop)
            (define-key julia-prefix-map "dc" 'ess-debug-command-continue)
            (define-key julia-prefix-map "dC" 'ess-debug-command-continue-multi)
            (define-key julia-prefix-map "de" 'ess-debug-command-next)
            (define-key julia-prefix-map "dE" 'ess-debug-command-next-multi)
            (define-key julia-prefix-map "du" 'ess-debug-command-up)
            (define-key julia-prefix-map "dq" 'ess-debug-command-quit)
            (define-key julia-prefix-map "db" 'ess-bp-set)
            (define-key julia-prefix-map "dB" 'ess-bp-set-conditional)
            (define-key julia-prefix-map "dd" 'ess-bp-kill)
            (define-key julia-prefix-map "dD" 'ess-bp-kill-all)
            (define-key julia-prefix-map "do" 'ess-bp-toggle-state)
            (define-key julia-prefix-map "dl" 'ess-bp-set-logger)
            (define-key julia-prefix-map "dj" 'ess-bp-next)
            (define-key julia-prefix-map "dk" 'ess-bp-previous)
            (define-key julia-prefix-map "dt" 'ess-show-traceback)
            (define-key julia-prefix-map "da" 'ess-show-call-stack)))


(provide 'init-julia)
;;; init-julia.el ends here

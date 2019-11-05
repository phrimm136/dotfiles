;;; package --- summary:
;;; Commentary:
;;; Code:


;;; ESS julia config

(leaf ess
  :init (require 'ess-site)
  :config (progn (setq inferior-julia-program "/bin/julia")
                 (eldoc-mode nil)))


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


;;; keymap

(defvar julia-prefix-map
  (let ((map (make-sparse-keymap)))
    ;; repl
    (define-key map "cj" 'run-ess-julia)
    (define-key map "cr" 'ess-eval-region)
    (define-key map "cc" 'ess-eval-buffer)
    ;; debug
    (define-key map "ds" 'ess-debug-start)
    (define-key map "dS" 'ess-debug-stop)
    (define-key map "dc" 'ess-debug-command-continue)
    (define-key map "dC" 'ess-debug-command-continue-multi)
    (define-key map "de" 'ess-debug-command-next)
    (define-key map "dE" 'ess-debug-command-next-multi)
    (define-key map "du" 'ess-debug-command-up)
    (define-key map "dq" 'ess-debug-command-quit)
    (define-key map "db" 'ess-bp-set)
    (define-key map "dB" 'ess-bp-set-conditional)
    (define-key map "dd" 'ess-bp-kill)
    (define-key map "dD" 'ess-bp-kill-all)
    (define-key map "do" 'ess-bp-toggle-state)
    (define-key map "dl" 'ess-bp-set-logger)
    (define-key map "dj" 'ess-bp-next)
    (define-key map "dk" 'ess-bp-previous)
    (define-key map "dt" 'ess-show-traceback)
    (define-key map "da" 'ess-show-call-stack)
    map))

(add-hook 'ess-julia-mode-hook
          (lambda ()
            (evil-leader/set-key-for-mode 'ess-julia-mode
              "<SPC>" julia-prefix-map)))


;;; init-julia.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


;;; ESS julia config

(leaf ess
  :straight t
  :init (require 'ess-site)
  :setq ((inferior-julia-program . "/bin/julia")))


;;; auto completion

;; (add-hook 'ess-julia-mode-hook
;;           (lambda ()
;;             (add-to-list (make-local-variable 'company-backends)
;;                          '(company-ess-julia-objects))
;;             (delete 'company-ess-julia-objects company-backends))) ;; breaks locality when using ess-use-company.


;;; linting

;; (leaf flycheck-julia
;;   :straight t
;;   :after flycheck julia-mode
;;   :config (progn (flycheck-julia-setup)))


;;; julia language server

(leaf lsp-julia
  :straight (lsp-julia :type git
                       :host github
                       :repo "non-Jedi/lsp-julia")
  :require t
  :after lsp
  :config (progn (setq lsp-julia-default-environment "~/.julia/environments/v1.3")
                 (add-to-list 'lsp-language-id-configuration '(ess-julia-mode . "ess-julia"))
                 (lsp-register-client (make-lsp-client :new-connection (lsp-stdio-connection 'lsp-julia--rls-command)
                                                       :major-modes '(ess-julia-mode)
                                                       :server-id 'julia-ls))))


;;; keymap

(defvar custom-julia-eval-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "r" 'ess-eval-region)
    (define-key map "b" 'ess-eval-buffer)
    map))
(defalias 'julia-eval custom-julia-eval-keymap)

(defvar custom-julia-debug-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "s" 'ess-debug-start)
    (define-key map "S" 'ess-debug-stop)
    (define-key map "c" 'ess-debug-command-continue)
    (define-key map "C" 'ess-debug-command-continue-multi)
    (define-key map "e" 'ess-debug-command-next)
    (define-key map "E" 'ess-debug-command-next-multi)
    (define-key map "u" 'ess-debug-command-up)
    (define-key map "q" 'ess-debug-command-quit)
    (define-key map "b" 'ess-bp-set)
    (define-key map "B" 'ess-bp-set-conditional)
    (define-key map "d" 'ess-bp-kill)
    (define-key map "D" 'ess-bp-kill-all)
    (define-key map "o" 'ess-bp-toggle-state)
    (define-key map "l" 'ess-bp-set-logger)
    (define-key map "j" 'ess-bp-next)
    (define-key map "k" 'ess-bp-previous)
    (define-key map "t" 'ess-show-traceback)
    (define-key map "a" 'ess-show-call-stack)
    map))
(defalias 'julia-debug custom-julia-debug-keymap)

(defvar custom-julia-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "e" 'julia-eval)
    (define-key map "d" 'julia-debug)
    (define-key map "j" 'run-ess-julia)
    map))
(defalias 'julia custom-julia-keymap)

(evil-leader/set-key-for-mode 'ess-julia-mode
  "<SPC>" 'julia)


;;; init-julia.el ends here

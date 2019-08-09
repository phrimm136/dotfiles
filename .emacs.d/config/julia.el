;;; package --- summary:
;;; Commentary:
;;; Code:


;;; julia-mode config

(leaf julia-mode
  :ensure t)


;;; ESS config

(defun julia-auto-start ()
  "Auto start julia kernal."
  (run-ess-julia (buffer-file-name (current-buffer))))

(leaf ess
  :init (require 'ess-site)
  :hook (ess-julia-mode . 'julia-auto-start)
  :config (progn (setq inferior-julia-program "/bin/julia")))


;;; auto compleion

(add-hook 'ess-julia-mode (lambda ()
                            (add-to-list (make-local-variable 'company-backends)
                                         '(ein:company-backend)))) ;; breaks locality when using ess-use-company.


;;; linting

(leaf flycheck-julia
  :ensure t
  :after flycheck julia-mode
  :config (progn (flycheck-julia-setup)))


;;; julia.el ends here

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
  :hook (ess-julia-mode . julia-auto-start)
  :config (progn (setq inferior-julia-program "/bin/julia")))


;;; auto compleion config

(eval-after-load "company" (setq ess-use-company t))


;;; flycheck config

(leaf flycheck-julia
  :ensure t
  :config (progn (flycheck-julia-setup)))


;;; highlight numbers

(add-hook 'ess-julia-mode-hook 'highlight-numbers-mode)

;;; julia.el ends here

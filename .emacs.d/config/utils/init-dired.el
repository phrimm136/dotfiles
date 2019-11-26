;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf dired-subtree
  :straight t
  :setq ((dired-subtree-line-prefix . (lambda (depth) (make-string (* 2 depth) ?\s)))
         (dired-subtree-use-backgrounds . nil)
         (dired-auto-revert-buffer . t))
  :config (progn (evil-define-key 'normal dired-mode-map
                   "gf" 'counsel-find-file
                   "gb" 'counsel-switch-buffer
                   (kbd "<tab>") 'dired-subtree-toggle
                   (kbd "<backtab>") 'dired-subtree-toggle)))

;;; init-dired.el ends here

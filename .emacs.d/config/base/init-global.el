;;; package --- summary:
;;; Commentary:
;;; Code:






;;; session manager

;; (leaf workgroups2
;;   :ensure t
;;   :setq ((wg-session-file . "/home/user/.emacs.d/workgroups")
;;          (wg-emacs-exit-save-behavior . nil)
;;          (wg-workgroups-mode-exit-save-behavior . nil)
;;          (wg-dissociate-buffer-on-kill-buffer . nil)) ;; This feature heavily slows down with lsp-mode
;;   :config (progn (add-hook 'wg-before-switch-to-workgroup-hook 'neotree-hide) ;; bug; or feature
;;                  ;; (add-hook 'wg-after-switch-to-workgroup-hook 'neotree-show)
;;                  (workgroups-mode 1)
;;                  (wg-open-session "/home/user/.emacs.d/workgroups")
;;                  (evil-leader/set-key
;;                    "w" wg-prefixed-map)))
;;; Remove unneccesary things







;;; init-global.el ends here

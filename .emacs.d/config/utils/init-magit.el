;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf magit
  :ensure t
  :config (progn (evil-define-key 'normal magit-mode-map
                   "j" 'magit-section-forward
                   "k" 'magit-section-backward
                   "<escape>" 'nil)
                 (evil-leader/set-key-for-mode 'magit-mode
                   "r" 'magit-refresh)))


(leaf magithub
  :ensure t
  :after magit
  :setq ((magithub-clone-default-directory . "~/github"))
  :config (progn (magithub-feature-autoinject t)))


;;; init-magit.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf magit
  :ensure t
  :config (progn (evil-define-key 'normal magit-mode-map
                   "j" 'magit-section-forward
                   "k" 'magit-section-backward
                   "<escape>" 'nil)
                 (evil-leader/set-key
                   "gg" 'magit-status)
                 (evil-leader/set-key-for-mode 'magit-mode
                   "r" 'magit-refresh)))


(leaf forge
  :ensure t
  :after magit
  :config )


;;; init-magit.el ends here

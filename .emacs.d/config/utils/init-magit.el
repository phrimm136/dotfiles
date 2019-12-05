;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf magit
  :straight t
  :config (progn (evil-define-key 'normal magit-mode-map
                   "j" 'magit-section-forward
                   "k" 'magit-section-backward
                   "<escape>" 'nil)
                 (evil-leader/set-key
                   "g" 'magit-status)
                 (evil-leader/set-key-for-mode 'magit-mode
                   "r" 'magit-refresh)))


;;; evil-mode integration

(leaf evil-magit
  :straight t
  :after magit
  :config (progn (evil-magit-init)))


;;; remote repo control

(leaf forge
  :straight t
  :after magit)


;;; init-magit.el ends here

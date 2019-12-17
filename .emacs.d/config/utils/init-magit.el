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
                   "m" 'magit-status)))


;;; remote repo control

(leaf forge
  :straight t
  :after magit
  :setq ((bug-reference-mode . 0)))


;;; TODOs on magit

(leaf magit-todos
  :straight t
  :after magit
  :hook (magit-mode-hook . magit-todos-mode))


;;; evil-mode integration

(leaf evil-magit
  :straight t
  :after magit
  :config (progn (evil-magit-init)))


;;; init-magit.el ends here

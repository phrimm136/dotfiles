;;; init-magit.el --- configuration for magit -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf magit
  :straight t
  :config (progn (evil-leader/set-key
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


;;; use delta

(leaf magit-delta
  :straight t
  :after magit
  :hook (magit-mode-hook . (lambda ()
                             (magit-delta-mode 1))))


(provide 'init-magit)

;;; init-magit.el ends here

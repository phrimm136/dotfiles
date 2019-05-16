;;; smex config

(use-package smex
  :ensure t
  :config (smex-initialize))


;;; flx config
(use-package flx
  :ensure t
  :config (progn (flx-ido-mode t)))


;;; ivy config

(use-package ivy
  :ensure t
  :config (progn (ivy-mode 1)
                 (recentf-mode t)
                 (global-fasd-mode t)
                 (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))))


;;; ivy + smex

(use-package ivy-smex
  :load-path "github/ivy-smex"
  :bind ("M-x" . ivy-smex))


;;; global company config

(use-package company
  :ensure t
  :config (progn (global-company-mode)
                 (company-quickhelp-local-mode)
                 (setq company-idle-delay 0.1)
                 (setq company-tooltip-idle-delay 0.1)))

;;; global fly-check config

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))


;;; parentheses config

(use-package paren
  :ensure t
  :config (progn (show-paren-mode 1)
		 (setq show-paren-style 'expression)
		 (set-face-background 'show-paren-match "#3bc9cb")))

(use-package evil-surround
  :config (global-evil-surround-mode 1))

(electric-pair-mode)


;;; dired-subtree config

(use-package dired-subtree
  :ensure t
  :after dired
  :config (progn (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s)))
                 (setq dired-subtree-use-backgrounds nil)
                 (add-hook 'dired-mode-hook 'dired-hide-details-mode)))


;;; workgroups config

(use-package workgroups2
  :ensure t
  :config (progn (setq wg-session-file "/home/user/.emacs.d/workgroups")
                 (setq wg-prefix-key (kbd "\C-c w"))
                 (setq wg-emacs-exit-save-behavior nil)
                 (setq wg-workgroups-mode-exit-save-behavior nil)
                 (wg-open-session "/home/user/.emacs.d/workgroups")
		 (workgroups-mode 1)))


;;; magit config

(use-package magit
  :ensure t)


;;; evil-magit config
(use-package evil-magit
  :ensure t)


;;; Line number config

(global-display-line-numbers-mode)


;;; Remove unneccesary configures

(progn (setq-default scroll-bar-mode nil)
       (menu-bar-mode 0)
       (tool-bar-mode 0)
       (setq-default indent-tabs-mode nil)
       (setq inhibit-startup-screen 1))

;;; Transparency

(set-frame-parameter (selected-frame) 'alpha '(80 60))
(add-to-list 'default-frame-alist '(alpha 80 60))

;;; color theme

(load-theme 'black t)


;;; font

(set-frame-font "DejaVuSansMono Nerd Font" nil t)


;;;

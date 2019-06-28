;;; package --- summary:
;;; Commentary:
;;; Code:


;;; vim emulator

(use-package evil
  :ensure t)

(use-package evil-leader
  :ensure t
  :config (progn (global-evil-leader-mode)
                 (evil-leader/set-leader "<SPC>")))


;;; minibuffer completion frontend

(use-package ivy
  :ensure t
  :config (progn (ivy-mode 1)
                 (recentf-mode t)
                 (global-fasd-mode t)
                 (setq ivy-wrap t)
                 (setq ivy-re-builders-alist '((swiper . ivy--regex-plus)
                                               (t . ivy--regex-fuzzy)))
                 (setq ivy-count-format "%d/%d ")))

(use-package counsel
  :ensure t
  :bind ("M-x" . 'counsel-M-x))

(use-package swiper
  :ensure t)


;;; M-x history

(use-package smex
  :ensure t
  :config (progn (smex-initialize)
                 (setq smex-save-file "~/.emacs.d/smex-items")
                 (setq smex-history-length 10)))

(use-package ivy-smex
  :load-path "github/ivy-smex")


;;; auto completion

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config (progn (setq company-idle-delay 0.2)))

(use-package company-quickhelp
  :ensure t
  :hook (prog-mode . company-quickhelp-mode)
  :config (progn (setq pos-tip-background-color "#2b2b2b")
                 (setq pos-tip-foreground-color "#ffffff")))


;;; syntax check

(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode)
  :config (progn (setq flycheck-errors-function nil)
                 ;; redifine flycheck prefix
                 (define-key flycheck-mode-map flycheck-keymap-prefix nil)
                 (setq flycheck-keymap-prefix (kbd "\C-c f"))
                 (define-key flycheck-mode-map flycheck-keymap-prefix flycheck-command-map)))

(use-package flycheck-pos-tip
  :ensure t
  :hook (prog-mode . flycheck-pos-tip-mode)
  :config (progn (setq flycheck-pos-tip-timeout 0)))


;;; show function details

(use-package eldoc
  :ensure t
  :config (progn (global-eldoc-mode)))


;;; parentheses

(use-package paren
  :ensure t
  :config (progn (show-paren-mode 1)
		 (setq show-paren-style 'parenthesis)
		 (set-face-background 'show-paren-match "#3bc9cb")))

(use-package evil-surround
  :ensure t
  :config (progn (global-evil-surround-mode 1)))

(electric-pair-mode)


;;; tree file explorer

(use-package dired-subtree
  :ensure t
  :after dired
  :config (progn (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s)))
                 (setq dired-subtree-use-backgrounds nil)
                 (add-hook 'dired-mode-hook 'dired-hide-details-mode)
                 (setq dired-auto-revert-buffer t)))


;;; session manager

(use-package workgroups2
  :ensure t
  :config (progn (setq wg-session-file "/home/user/.emacs.d/workgroups")
                 (setq wg-prefix-key (kbd "\C-c w"))
                 (setq wg-emacs-exit-save-behavior nil)
                 (setq wg-workgroups-mode-exit-save-behavior nil)
                 (workgroups-mode 1)
                 (wg-open-session "/home/user/.emacs.d/workgroups")
                 (wg-reload-session)))


;;; git

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t)


;;; replace all

(use-package iedit
  :ensure t)


;;; comment lines

(use-package evil-nerd-commenter
  :ensure t)


;;; folding code

(use-package evil-vimish-fold
  :ensure t
  :hook (prog-mode . vimish-fold-mode)
  :config (progn (setq vimish-fold-persist-on-saving t)))


;;; key cheatsheet

(use-package which-key
  :ensure t
  :config (progn (which-key-mode t)
                 (setq which-key-idle-delay 0.1)))


;;; project manager

(use-package projectile
  :ensure t
  :config (progn (projectile-mode t)))


;;; auto indent

(use-package aggressive-indent
  :ensure t
  :config (global-aggressive-indent-mode t))


;;; buffer groups

;; (use-package frame-bufs
;;   :load-path "~/.emacs.d/github/Frame-Bufs"
;;   :config (progn (frame-bufs-mode t)))


;;; Line number + current line highlight

(global-display-line-numbers-mode)

(use-package hl-line
  :ensure t
  :config (progn (global-hl-line-mode t)))


;;; dim inactive buffers

(use-package dimmer
  :ensure t
  :config (progn (dimmer-mode t)))


;;; vertical indent line

(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config (progn (setq highlight-indent-guides-method 'character)
                 (setq highlight-indent-guides-character ?\┊)
                 (setq highlight-indent-guides-responsive 'stack)
                 (setq highlight-indent-guides-delay 0)
                 (setq highlight-indent-guides-auto-character-face-perc 30)
                 (setq highlight-indent-guides-auto-top-character-face-perc 60)
                 (setq highlight-indent-guides-auto-stack-character-face-perc 45)))


;;; modeline

(use-package powerline-evil
  :ensure t
  :config (progn (powerline-center-evil-theme)))


;;; Remove unneccesary things

(progn (setq-default scroll-bar-mode nil)
       (menu-bar-mode 0)
       (tool-bar-mode 0)
       (setq-default indent-tabs-mode nil)
       (setq inhibit-startup-screen 1))


;;; Transparency

(set-frame-parameter (selected-frame) 'alpha '(80 80))
(add-to-list 'default-frame-alist '(alpha 80 80))


;;; color theme

(load-theme 'black t)


;;; font

(add-to-list 'default-frame-alist '(font . "DejaVuSansMono Nerd Font-6"))


;;;

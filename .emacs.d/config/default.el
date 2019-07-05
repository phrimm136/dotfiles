;;; package --- summary:
;;; Commentary:
;;; Code:


;;; vim emulator


(leaf evil
  :ensure t
  :init (setq evil-want-keybinding nil))

(leaf evil-collection
  :ensure t
  :config (progn (evil-collection-init)))

(leaf evil-leader
  :ensure t
  :config (progn (global-evil-leader-mode)
                 (evil-leader/set-leader "<SPC>")))


;;; minibuffer completion frontend

(leaf ivy
  :ensure t
  :config (progn (ivy-mode 1)
                 (recentf-mode t)
                 (global-fasd-mode t)
                 (setq ivy-wrap t)
                 (setq ivy-re-builders-alist '((swiper . ivy--regex-plus)
                                               (t . ivy--regex-fuzzy)))
                 (setq ivy-count-format "%d/%d ")))

(leaf counsel
  :ensure t
  :bind ("M-x" . counsel-M-x))

(leaf swiper
  :ensure t)


;;; M-x history

(leaf smex
  :ensure t
  :config (progn (smex-initialize)
                 (setq smex-save-file "~/.emacs.d/smex-items")
                 (setq smex-history-length 10)))

(leaf ivy-smex
  :url "https://github.com/purcell/ivy-smex")


;;; auto completion

(leaf company
  :ensure t
  :hook (prog-mode-hook . company-mode)
  :config (progn (setq company-idle-delay 0.2)))

(leaf company-quickhelp
  :ensure t
  :hook (prog-mode-hook . company-quickhelp-mode)
  :config (progn (setq pos-tip-background-color "#2b2b2b")
                 (setq pos-tip-foreground-color "#ffffff")))


;;; syntax check

(leaf flycheck
  :ensure t
  :hook (prog-mode-hook . flycheck-mode)
  :config (progn (setq flycheck-errors-function nil)
                 ;; redifine flycheck prefix
                 (define-key flycheck-mode-map flycheck-keymap-prefix nil)
                 (setq flycheck-keymap-prefix (kbd "\C-c f"))
                 (define-key flycheck-mode-map flycheck-keymap-prefix flycheck-command-map)))

(leaf flycheck-pos-tip
  :ensure t
  :hook (prog-mode-hook . flycheck-pos-tip-mode)
  :config (progn (setq flycheck-pos-tip-timeout 0)))


;;; show function details

(leaf eldoc
  :ensure t
  :config (progn (global-eldoc-mode)))


;;; parentheses

(leaf paren
  :ensure t
  :config (progn (show-paren-mode 1)
		 (setq show-paren-style 'parenthesis)
		 (set-face-background 'show-paren-match "#3bc9cb")))

(leaf evil-surround
  :ensure t
  :config (progn (global-evil-surround-mode 1)))

(electric-pair-mode)


;;; tree file explorer

(leaf dired-subtree
  :ensure t
  :after dired
  :hook (dired-mode-hook . dired-hide-details-mode)
  :config (progn (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s)))
                 (setq dired-subtree-use-backgrounds nil)
                 (setq dired-auto-revert-buffer t)))


;;; mode line

(load-file "~/.emacs.d/config/modeline.el")

(leaf hide-mode-line
  :ensure t
  :hook ((dired-mode-hook org-mode-hook org-agenda-mode-hook) . hide-mode-line-mode))


;;; session manager

(leaf workgroups2
  :ensure t
  :config (progn (setq wg-session-file "/home/user/.emacs.d/workgroups")
                 (setq wg-prefix-key (kbd "\C-c w"))
                 (setq wg-emacs-exit-save-behavior nil)
                 (setq wg-workgroups-mode-exit-save-behavior nil)
                 (workgroups-mode 1)
                 (wg-open-session "/home/user/.emacs.d/workgroups")
                 ))


;;; git

(leaf magit
  :ensure t)

(leaf evil-magit
  :ensure t)


;;; replace all

(leaf iedit
  :ensure t)


;;; comment lines

(leaf evil-nerd-commenter
  :ensure t)


;;; folding code

(leaf evil-vimish-fold
  :ensure t
  :hook (prog-mode-hook . vimish-fold-mode)
  :config (progn (setq vimish-fold-persist-on-saving t)))


;;; key cheatsheet

(leaf which-key
  :ensure t
  :config (progn (which-key-mode t)
                 (setq which-key-idle-delay 0.1)))


;;; project manager

(leaf projectile
  :ensure t
  :config (progn (projectile-mode t)))


;;; auto indent

(leaf aggressive-indent
  :ensure t
  :config (global-aggressive-indent-mode t))


;;; buffer groups

;; (leaf frame-bufs
;;   :url "https://github.com/alpaker/Frame-Bufs"
;;   :config (progn (frame-bufs-mode t)))


;;; Line number + current line highlight

(global-display-line-numbers-mode)

(leaf hl-line
  :ensure t
  :config (progn (global-hl-line-mode t)))


;;; dim inactive buffers

(leaf dimmer
  :ensure t
  :config (progn (dimmer-mode t)))


;;; vertical indent line

(leaf highlight-indent-guides
  :ensure t
  :hook (prog-mode-hook . highlight-indent-guides-mode)
  :config (progn (setq highlight-indent-guides-method 'character)
                 (setq highlight-indent-guides-character ?\┊)
                 (setq highlight-indent-guides-responsive 'stack)
                 (setq highlight-indent-guides-delay 0)
                 (setq highlight-indent-guides-auto-character-face-perc 30)
                 (setq highlight-indent-guides-auto-top-character-face-perc 60)
                 (setq highlight-indent-guides-auto-stack-character-face-perc 45)))


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

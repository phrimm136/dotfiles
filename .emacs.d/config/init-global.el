;;; package --- summary:
;;; Commentary:
;;; Code:


;;; visual

(set-frame-parameter (selected-frame) 'alpha 80) ; transparency

(load-theme 'black t) ; color theme

(add-to-list 'default-frame-alist '(font . "DejaVuSansMono Nerd Font-6")) ; font

(leaf highlight-numbers
  :ensure t
  :hook (prog-mode-hook . highlight-numbers-mode)) ; color numerics

(leaf goto-line-preview
  :ensure t) ; goto-line preview


;;; vim emulator

(leaf evil
  :ensure t
  :init (setq evil-want-keybinding nil))

(leaf evil-collection
  :ensure t
  :after evil)

(leaf evil-leader
  :ensure t
  :after evil
  :config (progn (global-evil-leader-mode)
                 (evil-leader/set-leader "<SPC>")))

(leaf iedit
  :ensure t)

(defvar evil-multiedit-state-map (make-sparse-keymap)) ;; https://github.com/hlissner/evil-multiedit/issues/13
(leaf evil-multiedit
  :ensure t
  :after evil iedit
  :config (progn))


;;; minibuffer completion frontend

(leaf counsel
  :ensure t
  :bind ("M-x" . counsel-M-x))

(leaf swiper
  :ensure t)

(leaf ivy
  :ensure t
  :config (progn (ivy-mode 1)
                 (setq ivy-wrap t
                       ivy-re-builders-alist '((swiper . ivy--regex-p)
                                               (t . ivy--regex-fuzzy))
                       ivy-count-format "%d/%d ")))


;;; show recent files

(recentf-mode t)


;;; M-x history

(leaf smex
  :ensure t
  :config (progn (smex-initialize)
                 (setq smex-save-file "~/.emacs.d/smex-items"
                       smex-history-length 10)))

(leaf ivy-smex
  :url "https://github.com/purcell/ivy-smex")


;;; auto completion

(leaf company
  :ensure t
  :hook (prog-mode-hook . company-mode)
  :config (progn (setq company-idle-delay 0.2
                       company-minimum-prefix-length 0
                       company-backends '((company-files
                                           company-yasnippet
                                           company-keywords
                                           company-capf)
                                          (company-abbrev
                                           company-dabbrev)))))

;; (leaf company-tabnine
;;   :ensure t
;;   :after company
;;   :config (progn (setf (car company-backends)
;;                        (append '(company-tabnine) (car company-backends)))))

(leaf company-math
  :ensure t
  :after company
  :config (progn (setf (car company-backends)
                       (append '(company-math-symbols-unicode) (car company-backends)))))

(leaf company-quickhelp
  :ensure t
  :after company
  :hook (prog-mode-hook . company-quickhelp-mode)
  :config (progn (setq pos-tip-background-color "#2b2b2b"
                       pos-tip-foreground-color "#ffffff"
                       company-quickhelp-delay 0.1)))


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
  :after flycheck
  :hook (prog-mode-hook . flycheck-pos-tip-mode)
  :config (progn (setq flycheck-pos-tip-timeout 0)))


;;; show function details

(leaf eldoc
  :ensure t
  :config (progn (global-eldoc-mode)))


;;; tree structured undo

(leaf undo-tree
  :ensure t
  :hook ((prog-mode-hook text-mode-hook) . undo-tree-mode))


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
  :config (progn (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s))
                       dired-subtree-use-backgrounds nil
                       dired-auto-revert-buffer t)))

(defvar speedbar-mode-map (make-sparse-keymap))
(leaf sr-speedbar
  :ensure t
  :config (progn ))


;;; mode line

(require 'init-modeline)

(leaf hide-mode-line
  :ensure t
  :hook ((dired-mode-hook org-mode-hook org-agenda-mode-hook) . hide-mode-line-mode))


;;; Line number + current line highlight

(add-hook 'prog-mode-hook
          (lambda ()
            (setq display-line-numbers 'relative)))

(leaf hl-line
  :ensure t
  :config (progn (global-hl-line-mode t)))


;;; vertical indent line

(leaf highlight-indent-guides
  :ensure t
  :hook (prog-mode-hook . highlight-indent-guides-mode)
  :config (progn (setq highlight-indent-guides-method 'character
                       highlight-indent-guides-responsive 'stack
                       highlight-indent-guides-delay 0
                       highlight-indent-guides-auto-character-face-perc 30
                       highlight-indent-guides-auto-top-character-face-perc 60
                       highlight-indent-guides-auto-stack-character-face-perc 45)))


;;; session manager

(leaf workgroups2
  :ensure t
  :config (progn (setq wg-session-file "/home/user/.emacs.d/workgroups"
                       wg-prefix-key (kbd "\C-c w")
                       wg-emacs-exit-save-behavior nil
                       wg-workgroups-mode-exit-save-behavior nil)
                 (workgroups-mode 1)
                 (wg-open-session "/home/user/.emacs.d/workgroups")))


;;; git

(leaf magit
  :ensure t)

(leaf evil-magit
  :ensure t
  :after magit
  :config (progn (evil-magit-init)))


;;; comment lines

(leaf evil-nerd-commenter
  :ensure t)


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


;;; dim inactive buffers

(leaf dimmer
  :ensure t
  :config (progn (dimmer-mode t)))


;;; code templates

(leaf yasnippet
  :url "https://github.com/joaotavora/yasnippet"
  :hook (prog-mode-hook . yas-minor-mode)
  :config (progn (yas-reload-all)))


;;; Remove unneccesary things

(progn (setq-default scroll-bar-mode nil
                     indent-tabs-mode nil)
       (menu-bar-mode 0)
       (tool-bar-mode 0)
       (setq inhibit-startup-screen 1))


;;; Trim trailing whitespaces when saving files.

(add-hook 'before-save-hook 'delete-trailing-whitespace)


(provide 'init-global)
;;; global.el ends here

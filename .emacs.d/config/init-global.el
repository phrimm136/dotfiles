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

(leaf quick-peek
  :ensure t
  :init (require 'quick-peek)
  :config (progn (setq quick-peek-add-spacer nil)))


;;; mode line

(require 'init-modeline)

(leaf hide-mode-line
  :ensure t
  :hook ((dired-mode-hook org-mode-hook org-agenda-mode-hook) . hide-mode-line-mode))


;;; quelpa

(leaf quelpa
  :ensure t
  :config (setq quelpa-update-melpa-p nil))


;;; vim emulator

(leaf evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :config (evil-mode 1))

(leaf evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))

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
  :config (progn (define-key evil-multiedit-state-map
                   "j" 'iedit-next-occurrence)
                 (define-key evil-multiedit-state-map
                   "k" 'iedit-prev-occurrence)
                 (define-key evil-multiedit-state-map
                   "\C-j" 'evil-multiedit-match-and-next)
                 (define-key evil-multiedit-state-map
                   "\C-k" 'evil-multiedit-match-and-prev)
                 (evil-leader/set-key
                   "ea" 'evil-multiedit-match-all
                   "ee" 'evil-multiedit-match-and-next
                   "er" 'evil-multiedit-restore)))


;;; minibuffer completion frontend

(leaf counsel
  :ensure t
  :config (progn (evil-define-key 'normal 'global
                   (kbd "C-SPC") 'counsel-M-x)))

(leaf swiper
  :ensure t
  :config (progn (evil-define-key 'normal 'global
                   "\C-s" 'swiper)))

(leaf ivy
  :ensure t
  :config (progn (ivy-mode 1)
                 (setq ivy-wrap t
                       ivy-re-builders-alist '((swiper . ivy--regex)
                                               (t . ivy--regex-fuzzy))
                       ivy-count-format "%d/%d ")
                 (define-key ivy-switch-buffer-map
                   "\C-j" 'ivy-next-line)
                 (define-key ivy-switch-buffer-map
                   "\C-k" 'ivy-previous-line)
                 (define-key ivy-minibuffer-map
                   "\C-j" 'ivy-next-line)
                 (define-key ivy-minibuffer-map
                   "\C-k" 'ivy-previous-line)))


;;; show recent files

(recentf-mode t)


;;; M-x history

(leaf smex
  :ensure t
  :config (progn (smex-initialize)
                 (setq smex-save-file "~/.emacs.d/smex-items"
                       smex-history-length 10)))

(quelpa '(ivy-smex :fetcher github
                   :repo "purcell/ivy-smex"))

;;; auto completion

(leaf company
  :ensure t
  :hook (prog-mode-hook . company-mode)
  :config (progn (setq company-idle-delay 0.2
                       company-minimum-prefix-length 1
                       company-backends '(company-files
                                          company-yasnippet
                                          company-keywords
                                          company-capf
                                          company-abbrev
                                          company-dabbrev))
                 (define-key company-active-map
                   (kbd "<tab>") 'company-complete)
                 (define-key company-active-map
                   "\C-j" 'company-select-next)
                 (define-key company-active-map
                   "\C-k" 'company-select-previous)))

;; (leaf company-tabnine
;;   :ensure t
;;   :after company
;;   :config (progn (setf (car company-backends)
;;                        (append '(company-tabnine) (car company-backends)))))

(leaf company-math
  :ensure t
  :after company
  :config (progn (add-to-list 'company-backends 'company-math-symbols-unicode)))

(leaf company-lsp
  :ensure t
  :after company lsp
  :config (progn (setq company-lsp-async t
                       company-lsp-cache-candidates nil
                       company-lsp-match-candidate-predicate 'company-lsp-match-candidate-prefix)))

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
  :config (progn (setq flycheck-errors-function nil
                       flycheck-idle-change-delay 0.5
                       flycheck-display-errors-delay 0.3)
                 ;; redifine flycheck prefix
                 (define-key flycheck-mode-map flycheck-keymap-prefix nil)
                 (setq flycheck-keymap-prefix (kbd "\C-c f"))
                 (define-key flycheck-mode-map flycheck-keymap-prefix flycheck-command-map)
                 (define-key flycheck-command-map
                   "j" 'flycheck-next-error)
                 (define-key flycheck-command-map
                   "k" 'flycheck-previous-error)))

(leaf flycheck-inline
  :ensure t
  :after quick-peek
  :hook (flycheck-mode-hook . flycheck-inline-mode)
  :config (progn (setq flycheck-inline-display-function
                       (lambda (msg pos)
                         (let* ((ov (quick-peek-overlay-ensure-at pos))
                                (contents (quick-peek-overlay-contents ov)))
                           (setf (quick-peek-overlay-contents ov)
                                 (concat contents (when contents "\n") msg))
                           (quick-peek-update ov)))
                       flycheck-inline-clear-function #'quick-peek-hide)))

;;; show function details

(leaf eldoc
  :ensure t
  :config (progn (global-eldoc-mode)))

;; (leaf eldoc-overlay
;;   :ensure t
;;   :config (progn (global-eldoc-overlay-mode 1)
;;                  (setq eldoc-overlay-in-minibuffer-flag t
;;                        eldoc-overlay-backend 'quick-peek)))


;;; language server protocol

(leaf lsp-mode
  :ensure t
  :after flycheck eldoc
  :hook (prog-mode-hook . lsp-deferred)
  :config (progn (setq lsp-enable-semantic-highlighting nil
                       lsp-keep-workspace-alive nil
                       lsp-prefer-flymake nil
                       lsp-log-io t
                       lsp-json-use-lists t)))


(leaf lsp-ui
  :ensure t
  :after lsp-mode
  :config (progn (add-hook 'lsp-mode-hook 'lsp-ui-mode)
                 (setq lsp-ui-doc-enable nil
                       lsp-ui-doc-header t
                       lsp-ui-peek-enable t
                       lsp-ui-peek-always-show nil
                       lsp-ui-peek-fontify 'on-demand
                       lsp-ui-sideline-enable nil
                       lsp-ui-sideline-show-hover nil
                       lsp-ui-sideline-show-diagnostics nil
                       lsp-ui-flycheck-enable t)
                 (evil-leader/set-key
                   "lfr" 'lsp-ui-peek-find-references
                   "lfd" 'lsp-ui-peek-find-definitions
                   "lfi" 'lsp-ui-peek-find-implementation
                   "lfs" 'lsp-ui-peek-find-workspace-symbol)
                 (with-eval-after-load 'lsp-ui
                   (define-key lsp-ui-peek-mode-map
                     "\C-j" 'lsp-ui-peek--select-next)
                   (define-key lsp-ui-peek-mode-map
                     "\C-k" 'lsp-ui-peek--select-prev)
                   (define-key lsp-ui-peek-mode-map
                     "\C-h" 'lsp-ui-peek--select-prev-file)
                   (define-key lsp-ui-peek-mode-map
                     "\C-l" 'lsp-ui-peek--select-next-file))))

;; (leaf eglot
;;   :ensure t
;;   :hook ((c-mode-common-hook python-mode-hook) . eglot-ensure)
;;   :config (progn (setq eglot-autoreconnect t)
;;                  (add-to-list 'eglot-server-programs
;;                               '((c-mode c++-mode) . (eglot-cquery "cquery")))
;;                  (evil-leader/set-key
;;                    "lfr" 'eglot-imenu)))


;;; tree structured undo

(leaf undo-tree
  :ensure t
  :hook ((prog-mode-hook text-mode-hook) . undo-tree-mode)
  :config (progn (setq undo-tree-enable-undo-in-region nil)))


;;; parentheses

(leaf paren
  :ensure t
  :config (progn (show-paren-mode 1)
                 (setq show-paren-style 'parenthesis)
                 (set-face-background 'show-paren-match "#ffffff")
                 (set-face-foreground 'show-paren-match "#000000")))

(leaf evil-surround
  :ensure t
  :config (progn (global-evil-surround-mode 1)))

(electric-pair-mode)


;;; tree file explorer

;; (leaf dired-subtree
;;   :ensure t
;;   :after dired
;;   :hook (dired-mode-hook . dired-hide-details-mode)
;;   :config (progn (setq dired-subtree-line-prefix (lambda (depth) (make-string (* 2 depth) ?\s))
;;                        dired-subtree-use-backgrounds nil
;;                        dired-auto-revert-buffer t)
;;                  (evil-define-key 'normal dired-mode-map
;;                    "gf" 'counsel-find-file
;;                    "gb" 'counsel-switch-buffer
;;                    (kbd "<tab>") 'dired-subtree-toggle
;;                    (kbd "<backtab>") 'dired-subtree-toggle
;;                    (kbd "<return>") 'dired-display-file)))

;; (defvar speedbar-mode-map (make-sparse-keymap)) ;; cannot load pre-defined variable; redefine it.
;; (leaf sr-speedbar
;;   :ensure t
;;   :config (progn (global-set-key (kbd "<C-tab>") 'sr-speedbar-toggle)
;;                  (define-key speedbar-mode-map
;;                    (kbd "<tab>") 'speedbar-toggle-line-expansion)))

(leaf treemacs)


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
  :ensure t
  :config (progn (evil-define-key 'normal magit-mode-map
                   "j" 'magit-section-forward
                   "k" 'magit-section-backward
                   (kbd "<escape>") 'nil)
                 (evil-leader/set-key-for-mode 'magit-mode
                   "r" 'magit-refresh)))

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
                 (setq which-key-show-early-on-C-h t
                       which-key-idle-delay 10000
                       which-key-idle-secondary-delay 0.1)))


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
  :ensure t
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


;;; splitting window for tentative buffers

(setq split-height-threshold 40
      split-width-threshold 160)


(provide 'init-global)
;;; init-global.el ends here

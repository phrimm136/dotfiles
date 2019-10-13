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
  :setq ((quick-peek-add-spacer . nil))
  :config ())

(leaf all-the-icons
  :ensure t)


;;; mode line

(load-file "~/.emacs.d/config/init-modeline.el")

(leaf hide-mode-line
  :ensure t
  :hook ((dired-mode-hook org-mode-hook org-agenda-mode-hook) . hide-mode-line-mode))


;;; quelpa

(leaf quelpa
  :ensure t
  :setq ((quelpa-update-melpa-p . nil))
  :config ())


;;; vim emulator

(leaf evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :config (progn (evil-mode 1)))

(leaf evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))

(leaf evil-leader
  :ensure t
  :after evil
  :config (progn (global-evil-leader-mode)
                 (evil-leader/set-leader "<SPC>")))

(leaf evil-multiedit
  :ensure t
  :after evil
  :config (progn (evil-leader/set-key
                   "ea" 'evil-multiedit-match-all
                   "ee" 'evil-multiedit-match-and-next
                   "er" 'evil-multiedit-restore))
  :bind ((:evil-multiedit-state-map
          :package iedit
          ("j" . iedit-next-occurrence)
          ("k" . iedit-prev-occurrence)
          ("C-j" . evil-multiedit-match-and-next)
          ("C-k" . evil-multiedit-match-and-prev))))


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
  :setq ((ivy-wrap . t)
         (ivy-re-builders-alist . '((swiper . ivy--regex)
                                    (t . ivy--regex-fuzzy)))
         (ivy-count-format . "%d/%d ")
         (ivy-use-selectable-prompt . t))
  :config (progn (ivy-mode 1))
  :bind ((:ivy-switch-buffer-map
          ("C-j" . ivy-next-line)
          ("C-k" . ivy-previous-line))
         (:ivy-minibuffer-map
          ("C-j" . ivy-next-line)
          ("C-k" . ivy-previous-line))))


;;; show recent files

(recentf-mode t)


;;; M-x history

(leaf smex
  :ensure t
  :setq ((smex-save-file . "~/.emacs.d/smex-items")
         (smex-history-length . 10))
  :config (progn (smex-initialize)
                 (quelpa '(ivy-smex :fetcher github
                                    :repo "purcell/ivy-smex"))))


;;; auto completion

(leaf company
  :ensure t
  :hook (prog-mode-hook . company-mode)
  :setq ((company-idle-delay . 0)
         (company-minimum-prefix-length . 2)
         (company-backends . '(company-files
                               company-keywords
                               company-capf
                               company-yasnippet
                               company-abbrev
                               company-dabbrev))
         (company-echo-truncate-lines . t)
         (company-echo-delay . nil))
  :config ()
  :bind (:company-active-map
         ("<tab>" . company-complete)))

;; (leaf company-tabnine
;;   :ensure t
;;   :after company
;;   :config (progn (add-to-list 'company-backends 'company-tabnine))) ; 1GB ram for a little time :thinking:

(leaf company-math
  :ensure t
  :after company
  :config (progn (add-to-list 'company-backends 'company-math-symbols-unicode)))

(leaf company-lsp
  :ensure t
  :after company lsp
  :setq ((company-lsp-async . t)
         (company-lsp-cache-candidates . 'auto)
         (company-lsp-match-candidate-predicate . 'company-lsp-match-candidate-prefix))
  :config ())

(leaf company-quickhelp
  :ensure t
  :after company
  :hook (prog-mode-hook . company-quickhelp-mode)
  :setq ((pos-tip-background-color . "#2b2b2b")
         (pos-tip-foreground-color . "#ffffff")
         (company-quickhelp-delay . 0.1)))


;;; syntax check

(leaf flycheck
  :ensure t
  :hook (prog-mode-hook . flycheck-mode)
  :setq ((flycheck-errors-function . nil)
         (flycheck-idle-change-delay . 0.5)
         (flycheck-display-errors-delay . 0.3))
  :config (progn (evil-leader/set-key
                   "f" flycheck-command-map))
  :bind ((:flycheck-command-map
          ("j" . flycheck-next-error)
          ("k" . flycheck-previous-error))))

(leaf flycheck-inline
  :ensure t
  :after flycheck quick-peek
  :setq ((flycheck-inline-display-function . (lambda (msg pos)
                                               (let* ((ov (quick-peek-overlay-ensure-at pos))
                                                      (contents (quick-peek-overlay-contents ov)))
                                                 (setf (quick-peek-overlay-contents ov)
                                                       (concat contents (when contents "\n") msg))
                                                 (quick-peek-update ov))))
         (flycheck-inline-clear-function 'quick-peek-hide))
  :config ())
(global-flycheck-inline-mode)


;;; show function details

(leaf eldoc
  :ensure t
  :config (progn (global-eldoc-mode)))


;;; language server protocol

(leaf lsp-mode
  :ensure t
  :after flycheck eldoc
  :hook (prog-mode-hook . lsp-deferred)
  :setq ((lsp-enable-semantic-highlighting . t)
         (lsp-keep-workspace-alive . nil)
         (lsp-enable-snippet . t)
         (lsp-prefer-flymake . nil)
         (lsp-log-io . nil)
         (lsp-json-use-lists . nil))
  :config (progn (evil-leader/set-key
                   "ll" 'lsp
                   "lr" 'lsp-restart-workspace
                   "ls" 'lsp-shutdown-workspace)))

(leaf lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode-hook . lsp-ui-mode)
  :setq ((lsp-ui-doc-enable . nil)
         (lsp-ui-doc-header . t)
         (lsp-ui-doc-delay . 0.1)
         (lsp-ui-doc-position . 'at-point)
         (lsp-ui-doc-border . "black")
         (lsp-ui-doc-use-childframe . t)
         (lsp-ui-peek-enable . t)
         (lsp-ui-peek-always-show . nil)
         (lsp-ui-peek-fontify . 'on-demand)
         (lsp-ui-sideline-enable . t)
         (lsp-ui-sideline-show-hover . t)
         (lsp-ui-sideline-show-diagnostics . t)
         (lsp-ui-flycheck-enable . nil)
         (lsp-ui-imenu-kind-position . 'left))
  :config (progn (evil-leader/set-key
                   "lfr" 'lsp-ui-peek-find-references
                   "lfd" 'lsp-ui-peek-find-definitions
                   "lfi" 'lsp-ui-peek-find-implementation
                   "lfs" 'lsp-ui-peek-find-workspace-symbol
                   "le" 'lsp-ui-flycheck-list))
  :bind ((:lsp-ui-peek-mode-map
          ("C-j" . lsp-ui-peek--select-next)
          ("C-k" . lsp-ui-peek--select-prev)
          ("C-h" . lsp-ui-peek--select-prev-file)
          ("C-l" . lsp-ui-peek--select-next-file))))

(with-eval-after-load 'lsp-mode
  (quelpa `(lsp-ivy :fetcher github
                    :repo "emacs-lsp/lsp-ivy")))

;; (leaf eglot
;;   :ensure t
;;   :hook ((c-mode-common-hook python-mode-hook) . eglot-ensure)
;;   :config (progn (setq eglot-autoreconnect t)
;;                  (add-to-list 'eglot-server-programs
;;                               '((c-mode c++-mode) . (eglot-cquery "cquery")))
;;                  (evil-leader/set-key
;;                    "lfr" 'eglot-imenu)))


;;; debug adapter protocol

(leaf dap-mode
  :ensure t
  :hook (lsp-mode . (dap-mode dap-ui-mode dap-tooltip-mode))
  :config (progn (dap-mode 1)
                 (dap-ui-mode 1)
                 (dap-tooltip-mode 1)))


;;; tree structured undo

(leaf undo-tree
  :ensure t
  :hook ((prog-mode-hook text-mode-hook) . undo-tree-mode)
  :setq ((undo-tree-enable-undo-in-region . nil))
  :config ())


;;; parentheses

(leaf paren
  :ensure t
  :setq ((show-paren-style . 'parenthesis))
  :config (progn (show-paren-mode 1)
                 (set-face-background 'show-paren-match "#ffffff")
                 (set-face-foreground 'show-paren-match "#000000")))

(leaf evil-surround
  :ensure t
  :setq ((global-evil-surround-mode . 1))
  :config ())

(electric-pair-mode)


;;; tree file explorer

(leaf dired-subtree
  :ensure t
  :setq ((dired-subtree-line-prefix . (lambda (depth) (make-string (* 2 depth) ?\s)))
         (dired-subtree-use-backgrounds . nil)
         (dired-auto-revert-buffer . t))
  :config (progn (evil-define-key 'normal dired-mode-map
                   "gf" 'counsel-find-file
                   "gb" 'counsel-switch-buffer
                   (kbd "<tab>") 'dired-subtree-toggle
                   (kbd "<backtab>") 'dired-subtree-toggle)))

(leaf neotree
  :ensure t
  :setq ((neo-autorefresh . nil)
         (neo-theme . 'ascii))
  :config (progn (add-hook 'switch-buffer-functions
                           (lambda (prev cur)
                             (neotree-refresh t)))))

;;; Line number + current line highlight

(add-hook 'prog-mode-hook
          (lambda ()
            (setq display-line-numbers 'relative)))

(leaf hl-line
  :ensure t
  :config (progn (global-hl-line-mode t)))


;;; session manager

(leaf workgroups2
  :ensure t
  :setq ((wg-session-file . "/home/user/.emacs.d/workgroups")
         (wg-emacs-exit-save-behavior . nil)
         (wg-workgroups-mode-exit-save-behavior . nil)
         (wg-dissociate-buffer-on-kill-buffer . nil)) ;; This feature heavily slows down with lsp-mode
  :config (progn (add-hook 'wg-before-switch-to-workgroup-hook 'neotree-hide)
                 (add-hook 'wg-after-switch-to-workgroup-hook 'neotree-show)
                 (workgroups-mode 1)
                 (wg-open-session "/home/user/.emacs.d/workgroups")
                 (evil-leader/set-key
                   "w" wg-prefixed-map)))


;;; git

(leaf magit
  :ensure t
  :config (progn (evil-define-key 'normal magit-mode-map
                   "j" 'magit-section-forward
                   "k" 'magit-section-backward
                   (kbd "<escape>") 'nil)
                 (evil-leader/set-key-for-mode 'magit-mode
                   "r" 'magit-refresh)
                 (leaf evil-magit
                   :ensure t
                   :config (progn (evil-magit-init)))))


;;; comment lines

(leaf evil-nerd-commenter
  :ensure t)


;;; key cheatsheet

(leaf which-key
  :ensure t
  :setq ((which-key-show-early-on-C-h . t)
         (which-key-idle-delay . 10000)
         (which-key-idle-secondary-delay . 0.1))
  :config (progn (which-key-mode t)))


;;; project manager

(leaf projectile
  :ensure t
  :config (progn (projectile-mode t)
                 (evil-leader/set-key
                   "p" projectile-command-map)))

(leaf counsel-projectile
  :ensure t
  :config (progn (counsel-projectile-mode t))
  :bind ((:projectile-command-map
          ("f" . counsel-projectile-find-file)
          ("g" . counsel-projectile-find-file-dwim)
          ("d" . counsel-projectile-find-dir)
          ("b" . counsel-projectile-switch-to-buffer)
          ("sg" . counsel-projectile-grep)
          ("ss" . counsel-projectile-ag)
          ("sr" . counsel-projectile-rg))))


;;; auto indent

(leaf aggressive-indent
  :ensure t
  :config (global-aggressive-indent-mode t))


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
       (setq inhibit-startup-screen 1)
       (fset 'yes-or-no-p 'y-or-n-p))


;;; Trim trailing whitespaces when saving files.

(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;; splitting window for tentative buffers

(setq split-height-threshold 40
      split-width-threshold 160)


(provide 'init-global)
;;; init-global.el ends here

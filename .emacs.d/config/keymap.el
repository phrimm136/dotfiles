;;; package --- summary:
;;; Commentary:
;;; Code:


;;; Evil keymap settings.

(progn (evil-mode 1)
       (define-key evil-normal-state-map (kbd "g RET") (vconcat "g" [return]))
       ;; command mode keymap custom
       (evil-ex-define-cmd ":" 'eval-expression)
       ;; leader-key mapped custom; function manipulating code
       (evil-leader/set-key
         "e" 'iedit-mode
         "r" 'revert-buffer
         "s" 'counsel-imenu
         ;; folding keymap
         "ff" 'vimish-fold
         "ft" 'vimish-fold-toggle
         "fT" 'vimish-fold-toggle-all
         "fd" 'vimish-fold-delete
         "fD" 'vimish-fold-delete-all
         "fw" 'vimish-fold-unfold
         "fW" 'vimish-fold-unfold-all
         "fr" 'vimish-fold-refold
         "fR" 'vimish-fold-refold-all
         "fj" 'vimish-fold-next-fold
         "fk" 'vimish-fold-previous-fold
         ;; commenting lines
         ";i" 'evilnc-comment-or-uncomment-lines
         ";l" 'evilnc-quick-comment-or-uncomment-to-the-line
         ";c" 'evilnc-copy-and-comment-lines
         ";p" 'evilnc-comment-or-uncomment-paragraphs
         ";r" 'comment-or-uncomment-region
         ";v" 'evilnc-toggle-invert-comment-line-by-line
         ";o" 'evilnc-copy-and-comment-operator
         ";k" 'evilnc-comment-and-kill-ring-save
         )
       ;; global keymap custom
       (evil-define-key 'insert 'global
         "\C-k" 'nil) ; for selecting in a floating box
       (evil-define-key 'motion 'global
         "gf" 'counsel-find-file
         "gr" 'counsel-recentf
         "gb" 'counsel-switch-buffer
         "gk" 'kill-buffer
         "\C-s" 'swiper)
       (evil-define-key 'normal 'global
         "\C-s" 'swiper
         "gf" 'counsel-find-file
         "gr" 'counsel-recentf
         "gb" 'counsel-switch-buffer
         "gk" 'kill-buffer
         )
       ;; company keymap custom
       (define-key company-active-map (kbd "C-j") #'company-select-next)
       (define-key company-active-map (kbd "C-k") #'company-select-previous)
       ;; c/cpp keymap custom
       (evil-define-key 'normal c-mode-base-map
         ;; Compile, CMake
         "gcr" 'cmake-ide-run-cmake
         "gcc" 'cmake-ide-compile
         "gcC" 'cmake-ide-compile*
         "gcd" 'cmake-ide-delete-file
         "gcD" 'cmake-ide-delete-build-dir
         ;; RTags
         "gcf" 'rtags-find-file
         "gcF" 'rtags-diagnostics
         "gcj" 'rtags-next-diag
         "gck" 'rtags-previous-diag
         "gct" 'rtags-dependency-tree
         "gcT" 'rtags-references-tree
         ;; Debugger
         "gcb" 'cmake-ide-run-gdb
         "gcx" 'cmake-ide-run-exe
         "gco" 'cmake-ide-objdump
         )
       ;; shell keymap custom
       (evil-define-key 'insert eshell-mode-map
         "\C-k" 'eshell-previous-input
         "\C-j" 'eshell-next-input)
       ;; python keymap custom
       (evil-define-key 'normal python-mode-map
         "gcc" 'python-shell-send-region
         "gcf" 'python-shell-send-buffer)
       ;; julia keymap custom
       (evil-define-key 'normal ess-julia-mode-map
         "gcc" 'ess-eval-region
         "gcf" 'ess-eval-buffer)
       ;; file explorer keymap custom
       (evil-define-key 'normal dired-mode-map
         "gf" 'counsel-find-file
         "gb" 'counsel-switch-buffer
         (kbd "<tab>") 'dired-subtree-toggle
         (kbd "<backtab>") 'dired-subtree-toggle
         (kbd "<return>") 'dired-display-file)
       ;; magit keymap custom
       (evil-define-key 'normal magit-mode-map
         "gk" 'kill-buffer
         "j" 'magit-section-forward
         "k" 'magit-section-backward
         [escape] 'nil)
       ;; pdf viewer keymap custom
       (evil-set-initial-state 'pdf-view-mode 'normal)
       (evil-define-key 'normal pdf-view-mode-hook
         "j" 'pdf-view-scroll-up-or-next-page
         "k" 'pdf-view-scroll-down-or-previous-page)
       ;; ipython keymap custom
       (evil-define-key 'normal ein:notebook-mode-map
         "gg" 'evil-goto-first-line ; bug on default setting
         )
       ;; minibuffer keymap custom
       (define-key ivy-minibuffer-map
         "\C-j" 'ivy-next-line)
       (define-key ivy-minibuffer-map
         "\C-k" 'ivy-previous-line)
       (define-key minibuffer-local-map
         "\C-j" 'next-line-or-history-element)
       (define-key minibuffer-local-map
         "\C-k" 'previous-line-or-history-element)
       ;; flycheck keymap custom
       (define-key flycheck-command-map
         "j" 'flycheck-next-error)
       (define-key flycheck-command-map
         "k" 'flycheck-previous-error)
       ;; org keymap custom
                                        ;                 (evil-define-key 'normal 'org-mode)
       )

;;;

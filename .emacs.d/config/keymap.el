;;; package --- summary:
;;; Commentary:
;;; Code:


;;; Evil keymap settings.

(progn (evil-mode 1)
       ;; command mode keymap custom
       (evil-ex-define-cmd ":" 'eval-expression)
       ;; leader-key mapped custom
       (evil-leader/set-key
         "e" 'iedit-mode
         "<RET>" 'revert-buffer
         "s" 'counsel-imenu
         ;; folding codes
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
       (evil-leader/set-key
         "\C-s" 'swiper
         "gf" 'counsel-find-file
         "gr" 'counsel-recentf
         "gb" 'counsel-switch-buffer
         "gk" 'kill-buffer)
       (evil-define-key 'normal 'global
         "\C-s" 'swiper)
       ;; c keymap custom
       (evil-leader/set-key-for-mode 'c-mode
         ;; Compile, CMake
         "cr" 'cmake-ide-run-cmake
         "cc" 'cmake-ide-compile
         "cC" 'cmake-ide-compile*
         "cd" 'cmake-ide-delete-file
         "cD" 'cmake-ide-delete-build-dir
         ;; RTags
         "rf" 'rtags-find-file
         "rF" 'rtags-diagnostics
         "rj" 'rtags-next-diag
         "rk" 'rtags-previous-diag
         "rt" 'rtags-dependency-tree
         "rT" 'rtags-references-tree
         ;; Debugger
         "db" 'cmake-ide-run-gdb
         "dx" 'cmake-ide-run-exe
         "do" 'cmake-ide-objdump
         )
       ;; cpp keymap custom
       (evil-leader/set-key-for-mode 'c++-mode
         ;; Compile, CMake
         "cr" 'cmake-ide-run-cmake
         "cc" 'cmake-ide-compile
         "cC" 'cmake-ide-compile*
         "cd" 'cmake-ide-delete-file
         "cD" 'cmake-ide-delete-build-dir
         ;; RTags
         "rf" 'rtags-find-file
         "rF" 'rtags-diagnostics
         "rj" 'rtags-next-diag
         "rk" 'rtags-previous-diag
         "rt" 'rtags-dependency-tree
         "rT" 'rtags-references-tree
         ;; Debugger
         "db" 'cmake-ide-run-gdb
         "dx" 'cmake-ide-run-exe
         "do" 'cmake-ide-objdump
         )
       ;; shell keymap custom
       (evil-define-key 'insert eshell-mode-map
         "\C-k" 'eshell-previous-input
         "\C-j" 'eshell-next-input)
       ;; python keymap custom
       (evil-leader/set-key-for-mode 'python-mode
         ;; repl
         "cc" 'python-shell-send-region
         "cf" 'python-shell-send-buffer)
       ;; ipython keymap custom
       (evil-define-key 'normal ein:notebook-mode-map
         "gg" 'evil-goto-first-line ; bug on default setting
         )
       ;; julia keymap custom
       (evil-leader/set-key-for-mode 'ess-julia-mode
         ;; repl
         "cc" 'ess-eval-region
         "cf" 'ess-eval-buffer
         "cr" 'run-ess-julia
         ;; debug
         "ds" 'ess-debug-start
         "dS" 'ess-debug-stop
         "dc" 'ess-debug-command-continue
         "dC" 'ess-debug-command-continue-multi
         "de" 'ess-debug-command-next
         "dE" 'ess-debug-command-next-multi
         "du" 'ess-debug-command-up
         "dq" 'ess-debug-command-quit
         "db" 'ess-bp-set
         "dB" 'ess-bp-set-conditional
         "dd" 'ess-bp-kill
         "dD" 'ess-bp-kill-all
         "do" 'ess-bp-toggle-state
         "dl" 'ess-bp-set-logger
         "dj" 'ess-bp-next
         "dk" 'ess-bp-previous
         "dt" 'ess-show-traceback
         "da" 'ess-show-call-stack
         )
       ;; clojure keymap custom
       (evil-leader/set-key-for-mode 'clojure-mode
         ;; repl
         "cc" 'cider-eval-region
         "cf" 'cider-eval-buffer
         ;; debug
         "dr" 'cider-eval-defun-at-point
         )
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
         "gb" 'counsel-switch-buffer
         "j" 'magit-section-forward
         "k" 'magit-section-backward
         (kbd "<escape>") 'nil)
       (evil-leader/set-key-for-mode 'magit-mode
         "r" 'magit-refresh)
       ;; pdf viewer keymap custom
       (evil-set-initial-state 'pdf-view-mode 'normal)
       (evil-leader/set-key-for-mode 'pdf-view-mode
         "g" 'goto-line)
       ;; minibuffer keymap custom
       (define-key ivy-switch-buffer-map
         "\C-j" 'ivy-next-line)
       (define-key ivy-switch-buffer-map
         "\C-k" 'ivy-previous-line)
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

;;; keymap.el ends here

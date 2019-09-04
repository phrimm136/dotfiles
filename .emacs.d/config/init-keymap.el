;;; package --- summary:
;;; Commentary:
;;; Code:


;;; Evil keymap settings.

(progn (evil-mode 1)
       (evil-collection-init)
       ;; global keymap custom
       (evil-leader/set-key
         "<RET>" 'revert-buffer
         "<SPC>" 'counsel-M-x
         ":" 'eval-expression
         ;; ivy keymap
         "gf" 'counsel-find-file
         "gr" 'counsel-recentf
         "gb" 'counsel-switch-buffer
         "gk" 'kill-buffer
         "gs" 'counsel-semantic-or-imenu
         ;; undo tree
         "u" 'undo-tree-visualize
         ;; commenting lines
         ";i" 'evilnc-comment-or-uncomment-lines
         ";l" 'evilnc-quick-comment-or-uncomment-to-the-line
         ";c" 'evilnc-copy-and-comment-lines
         ";p" 'evilnc-comment-or-uncomment-paragraphs
         ";r" 'comment-or-uncomment-region
         ";v" 'evilnc-toggle-invert-comment-line-by-line
         ";o" 'evilnc-copy-and-comment-operator
         ";k" 'evilnc-comment-and-kill-ring-save
         ;; narrowing
         "nf" 'narrow-to-defun
         "nr" 'narrow-to-region
         "nw" 'widen
         ;; function for functions
         "[" 'beginning-of-defun
         "]" 'end-of-defun
         "v" 'mark-defun)
       (global-unset-key "\C-j")
       (global-unset-key "\C-k")
       (evil-define-key 'insert 'global
         "\C-j" 'nil
         "\C-k" 'nil)
       (evil-define-key 'normal 'global
         "\C-s" 'swiper
         "\C-j" 'forward-sexp
         "\C-k" 'backward-sexp)
       ;; multiedit custom
       (define-key evil-multiedit-state-map
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
         "er" 'evil-multiedit-restore)
       ;; speedbar custom
       (global-set-key (kbd "<C-tab>") 'sr-speedbar-toggle)
       (define-key speedbar-mode-map
         (kbd "<tab>") 'speedbar-toggle-line-expansion)
       ;; company custom
       (define-key company-active-map
         (kbd "<tab>") 'company-complete)
       (define-key company-active-map
         "\C-j" 'company-select-next)
       (define-key company-active-map
         "\C-k" 'company-select-previous)
       ;; flycheck custom
       (define-key flycheck-command-map
         "j" 'flycheck-next-error)
       (define-key flycheck-command-map
         "k" 'flycheck-previous-error)
       ;; c keymap custom
       (evil-leader/set-key-for-mode 'c-mode
         ;; Compile, CMake
         "cr" 'cmake-ide-run-cmake
         "cc" 'cmake-ide-compile
         "cC" 'cmake-ide-compile*
         "cd" 'cmake-ide-delete-file
         "cD" 'cmake-ide-delete-build-dir
         ;; RTags
         "rff" 'rtags-find-file
         "rfr" 'rtags-find-references-at-point
         "rfR" 'rtags-find-references-current-dir
         "rfs" 'rtags-find-symbol-at-point
         "rfS" 'rtags-find-symbol-current-dir
         "rfv" 'rtags-find-virtuals-at-point
         "rdd" 'rtags-diagnostics
         "rdj" 'rtags-next-diag
         "rdk" 'rtags-previous-diag
         "rt" 'rtags-dependency-tree
         "rT" 'rtags-references-tree
         "rv" 'rtags-print-enum-value-at-point
         "rj" 'rtags-location-stack-forward
         "rk" 'rtags-location-stack-back
         "rp" 'rtags-reparse-file
         "rP" 'rtags-preprocess-file
         "rr" 'rtags-rename-symbol
         ;; Debugger
         "db" 'cmake-ide-run-gdb
         "dx" 'cmake-ide-run-exe
         "do" 'cmake-ide-objdump)
       ;; cpp keymap custom
       (evil-leader/set-key-for-mode 'c++-mode
         ;; Compile, CMake
         "cr" 'cmake-ide-run-cmake
         "cc" 'cmake-ide-compile
         "cC" 'cmake-ide-compile*
         "cd" 'cmake-ide-delete-file
         "cD" 'cmake-ide-delete-build-dir
         ;; RTags
         "rff" 'rtags-find-file
         "rfr" 'rtags-find-references-at-point
         "rfR" 'rtags-find-references-current-dir
         "rfs" 'rtags-find-symbol-at-point
         "rfS" 'rtags-find-symbol-current-dir
         "rfv" 'rtags-find-virtuals-at-point
         "rdd" 'rtags-diagnostics
         "rdj" 'rtags-next-diag
         "rdk" 'rtags-previous-diag
         "rt" 'rtags-dependency-tree
         "rT" 'rtags-references-tree
         "rv" 'rtags-print-enum-value-at-point
         "rj" 'rtags-location-stack-forward
         "rk" 'rtags-location-stack-back
         "rp" 'rtags-reparse-file
         "rP" 'rtags-preprocess-file
         "rr" 'rtags-rename-symbol
         ;; Debugger
         "db" 'cmake-ide-run-gdb
         "dx" 'cmake-ide-run-exe
         "do" 'cmake-ide-objdump)
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
         "da" 'ess-show-call-stack)
       ;; clojure keymap custom
       (evil-leader/set-key-for-mode 'clojure-mode
         ;; repl
         "cc" 'cider-eval-region
         "cf" 'cider-eval-buffer
         ;; debug
         "dr" 'cider-eval-defun-at-point)
       ;; file explorer keymap custom
       (evil-define-key 'normal dired-mode-map
         "gf" 'counsel-find-file
         "gb" 'counsel-switch-buffer
         (kbd "<tab>") 'dired-subtree-toggle
         (kbd "<backtab>") 'dired-subtree-toggle
         (kbd "<return>") 'dired-display-file)
       ;; magit keymap custom
       (evil-define-key 'normal magit-mode-map
         "j" 'magit-section-forward
         "k" 'magit-section-backward
         (kbd "<escape>") 'nil)
       (evil-leader/set-key-for-mode 'magit-mode
         "r" 'magit-refresh)
       ;; pdf viewer keymap custom
       (evil-set-initial-state 'pdf-view-mode 'normal)
       (evil-leader/set-key-for-mode 'pdf-view-mode
         "p" 'goto-line-preview)
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
         "\C-k" 'previous-line-or-history-element))


(provide 'init-keymap)
;;; keymap.el ends here

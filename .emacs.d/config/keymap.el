;;; Evil keymap settings.

;;; Code:


(use-package evil
  :load-path "github/evil"
  :config (progn (evil-mode 1)
                 (global-unset-key "\C-h")
                 (evil-define-key 'insert 'global
                   "\C-a" 'evil-normal-state)
                 (evil-define-key 'emacs 'global
                   "\C-h" 'evil-window-left
                   "\C-j" 'evil-window-down
                   "\C-k" 'evil-window-up
                   "\C-l" 'evil-window-right)
                 (evil-define-key 'normal 'global
                   "gf" 'find-file
                   "gr" 'counsel-recentf
                   "gb" 'switch-to-buffer
                   "gk" 'kill-buffer
                   "gh" 'help-command
                   "\C-h" 'evil-window-left
                   "\C-j" 'evil-window-down
                   "\C-k" 'evil-window-up
                   "\C-l" 'evil-window-right)
                 (evil-define-key 'motion 'global
                   "gf" 'find-file
                   "gr" 'counsel-recentf
                   "gb" 'switch-to-buffer
                   "gk" 'kill-buffer
                   "gh" 'help-command
                   "\C-h" 'evil-window-left
                   "\C-j" 'evil-window-down
                   "\C-k" 'evil-window-up
                   "\C-l" 'evil-window-right)
                 (evil-define-key 'insert 'eshell-mode-map
                   "\C-k" 'eshell-previous-input
                   "\C-j" 'eshell-next-input)
                 (evil-define-key 'normal 'python-mode-map
                   "gcr" 'python-shell-send-region
                   "gca" 'python-shell-send-buffer)
                 (evil-define-key 'visual 'python-mode-map
                   ";" 'comment-dwim)
                 (evil-define-key 'normal 'ess-julia-mode-map
                   "gcr" 'ess-eval-region
                   "gca" 'ess-eval-buffer)
                 (evil-define-key 'normal 'dired-mode-map
                   (kbd "<tab>") 'dired-subtree-toggle
                   (kbd "<backtab>") 'dired-subtree-toggle
                   (kbd "<enter>") 'dired-subtree-insert)
                 (evil-define-key 'normal 'magit-mode-hook
                   "gk" 'kill-buffer)
                 (evil-set-initial-state 'pdf-view-mode 'normal)
                 (evil-define-key 'normal 'pdf-view-mode-hook
                   "j" 'pdf-view-scroll-up-or-next-page
                   "k" 'pdf-view-scroll-down-or-previous-page
                   )))


;;;

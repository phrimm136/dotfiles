;;; package --- summary:
;;; Commentary:
;;; Code:


;;; fancy start page

(leaf dashboard
  :straight t
  :setq ((dashboard-banner-logo-title . "Welcome back to Emacs!")
         (dashboard-startup-banner . 'logo)
         (dashboard-items . '((recents  . 10)
                              (bookmarks . 5)
                              (projects . 10)
                              (agenda . 5))))
  :config (progn (dashboard-setup-startup-hook)
                 (evil-set-initial-state 'dashboard-mode 'insert)
                 (define-key dashboard-mode-map "\C-w" evil-window-map)))

(leaf dashboard-hackernews
  :straight t)


;;; init-dashboard.el ends here

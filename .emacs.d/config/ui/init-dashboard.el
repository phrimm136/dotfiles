;;; package --- summary:
;;; Commentary:
;;; Code:


;;; fancy start page

(leaf dashboard
  :ensure t
  :setq ((dashboard-banner-logo-title . "Welcome back to Emacs!")
         (dashboard-startup-banner . 'logo)
         (dashboard-items . '((recents  . 5)
                              (bookmarks . 5)
                              (projects . 5)
                              (agenda . 5))))
  :config (progn (dashboard-setup-startup-hook)
                 (evil-set-initial-state 'dashboard-mode 'insert)
                 (define-key dashboard-mode-map "\C-w" evil-window-map)))

(leaf dashboard-hackernews
  :ensure t)


;;; init-dashboard.el ends here

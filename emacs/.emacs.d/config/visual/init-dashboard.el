;;; init-dashboard.el --- configuration for dashboard -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; fancy start page

(leaf dashboard
  :straight t
  :setq ((dashboard-banner-logo-title . "Welcome back to Emacs!")
         (dashboard-startup-banner . 'logo)
         (dashboard-items . '((recents  . 20)
                              (bookmarks . 10)
                              (projects . 10)
                              (agenda . 5)))
         (dashboard-center-content . t))
  :config (progn (dashboard-setup-startup-hook)
                 (evil-set-initial-state 'dashboard-mode 'motion)))

(leaf dashboard-hackernews
  :straight t)


;;; init-dashboard.el ends here

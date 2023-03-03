;;; init-feed.el --- configuration for feed viewer -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(leaf elfeed
  :straight t
  :setq ((elfeed-show-entry-switch . 'display-buffer)))

(leaf elfeed-org
  :straight t
  :setq ((elfeed-show-entry-switch . 'display-buffer)
         (rmh-elfeed-org-files . '("~/.emacs.d/elfeed.org")))
  :config (elfeed-org))


(provide 'init-feed)

;;; init-feed.el ends here

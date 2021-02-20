;;; init-eaf.el --- configuration for eaf -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:




;;; Commentary:

;;; Code:

(leaf eaf
  :straight (eaf :type git
                 :host github
                 :repo "manateelazycat/emacs-application-framework"
                 :files ("app" "core" "eaf.py" "eaf.el"))
  :init (require 'eaf)
  :setq ((eaf-find-alternate-file-in-dired . t))
  :config (progn (evil-set-initial-state 'eaf-mode 'emacs)))


(provide 'init-eaf)

;;; init-eaf.el ends here

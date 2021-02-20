;;; init-eaf.el --- configuration for eaf -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:


;;; Dependencies

(leaf emacs-ctable
  :straight (ctable :type git
                    :host github
                    :repo "kiwanami/emacs-ctable"))
(leaf deferred
  :straight t)
(leaf epc
  :straight t)
(leaf wmctrl
  :straight t)


;;; eaf

(leaf eaf
  :straight (eaf :type git
                 :host github
                 :repo "manateelazycat/emacs-application-framework"
                 :files ("app" "core" "eaf-evil.el" "eaf-org.el" "eaf.el" "eaf.py"))
  :after wmctrl
  :require t
  :setq ((eaf-find-alternate-file-in-dired . t)))


(provide 'init-eaf)

;;; init-eaf.el ends here

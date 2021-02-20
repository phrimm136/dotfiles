;;; init-which-key.el --- configuration for which-key -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf which-key
  :straight t
  :setq ((which-key-show-early-on-C-h . t)
         (which-key-idle-delay . 10000)
         (which-key-idle-secondary-delay . 0.1))
  :config (progn (which-key-mode t)))


;;; init-which-key.el ends here

;;; init-visual-regexp.el --- configurations for visual-regexp -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf visual-regexp
  :straight t
  :config (progn (evil-leader/set-key
                   "r" 'vr/replace)))


(provide 'init-visual-regexp)

;;; init-visual-regexp.el ends here

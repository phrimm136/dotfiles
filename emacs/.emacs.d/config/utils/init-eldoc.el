;;; init-eldoc.el --- configuration for eldoc -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf eldoc
  :config (progn (global-eldoc-mode)))

;; (leaf eldoc-overlay
;;   :straight t
;;   :after eldoc
;;   :config (progn (global-eldoc-overlay-mode)))


;;; init-eldoc.el ends here

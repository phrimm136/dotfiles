;;; package --- summary:
;;; Commentary:
;;; Code:


;;; julia-mode config

(use-package julia-mode
  :ensure t)


;;; ESS config

(use-package ess
  :init (require 'ess-site)
  :config (progn (setq inferior-julia-program "/bin/julia")))


;;; auto compleion config

(setq ess-use-company t)


;;; flycheck config

(flycheck-julia-setup)
                                        ;(add-to-list flycheck-global-modes 'julia-mode)
                                        ;(add-to-list flycheck-global-modes 'ess-julia-mode)

;;; highlight numbers

(add-hook 'ess-julia-mode-hook 'highlight-numbers-mode)

;;;

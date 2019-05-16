;;; pdf-tools config

(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config (progn (display-line-numbers-mode nil)))


;;;

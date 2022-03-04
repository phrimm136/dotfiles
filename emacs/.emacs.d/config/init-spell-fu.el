;;; init-spell-fu.el --- configuration for spell-fu -*- lexical-scope: t -*-

;;; Commentary:

;;; Code:


(leaf spell-fu
  :straight t
  :hook ((prog-mode-hook org-mode-hook text-mode-hook) . spell-fu-mode))


(provide 'init-spell-fu)

;;; init-spell-fu.el ends here

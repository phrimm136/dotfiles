;;; init-flyspell.el --- configuration for flyspell -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf flyspell
  :hook (((org-mode-hook text-mode-hook) . flyspell-mode)
         (prog-mode-hook . flyspell-prog-mode)))


(provide 'init-flyspell)

;;; init-flyspell.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf flycspell
  :hook (((org-mode-hook text-mode-hook) . flyspell-mode)
         (prog-mode-hook . flyspell-prog-mode)))


;;; init-flyspell.el ends here

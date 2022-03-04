;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf smex
  :straight t
  :setq ((smex-save-file . "~/.emacs.d/smex-items")
         (smex-history-length . 10))
  :config (progn (smex-initialize)))

(provide 'init-smex)

;;; init-smex.el ends here

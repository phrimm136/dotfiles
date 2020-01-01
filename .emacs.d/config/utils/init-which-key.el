;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf which-key
  :straight t
  :setq ((which-key-show-early-on-C-h . t)
         (which-key-idle-delay . 10000)
         (which-key-idle-secondary-delay . 0.1))
  :config (progn (which-key-mode t)))


;;; upper whichkey

(leaf which-key-posframe
  :straight t
  :setq ((which-key-posframe-poshandler . 'posframe-poshandler-frame-top-center))
  :config (progn (which-key-posframe-mode 1)))


;;; init-which-key.el ends here

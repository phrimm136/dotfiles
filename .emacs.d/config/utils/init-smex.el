;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf smex
  :ensure t
  :after ivy
  :setq ((smex-save-file . "~/.emacs.d/smex-items")
         (smex-history-length . 10))
  :config (progn (smex-initialize)
                 (quelpa '(ivy-smex :fetcher github
                                    :repo "purcell/ivy-smex"))))


;;; init-smex.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:

(leaf async
  :ensure t
  :setq ((async-bytecomp-allowed-packages . '(all)))
  :config (progn (async-bytecomp-package-mode 1)))


;;; init-async.el ends here

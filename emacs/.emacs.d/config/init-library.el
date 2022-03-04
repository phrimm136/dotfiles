;;; init-library --- configuration for some libraries -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; quick-peek

(leaf quick-peek
  :straight t
  :setq ((quick-peek-add-spacer . nil))
  :config ())


;;; async

(leaf async
  :straight t
  :setq ((async-bytecomp-allowed-packages . '(all)))
  :config (progn (dired-async-mode 1)))


(provide 'init-library)

;;; init-library.el ends here

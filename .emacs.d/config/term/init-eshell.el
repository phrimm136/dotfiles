;;; package --- summary:
;;; Commentary:
;;; Code:

;;; split below frame after running eshell

(setq display-buffer-alist '(("\\`\\*e?shell" display-buffer-pop-up-window)))


;;; keymap

(evil-define-key 'insert eshell-mode-map
  "\C-k" 'eshell-previous-input
  "\C-j" 'eshell-next-input)


;;; init-eshell.el ends here

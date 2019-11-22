;;; package --- summary:
;;; Commentary:
;;; Code:


;;; just one press for yes or no

(fset 'yes-or-no-p 'y-or-n-p)


;;; Trim trailing whitespaces when saving files.

(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;; no tabs

(setq-default indent-tabs-mode nil)


;;; redirect backup to separate directory; not more #

(setq-default backup-directory-alist '(("." . "~/.emacs.d/backup")))


;;; narrow codes

(put 'narrow-to-region 'disabled nil)

(defvar custom-narrow-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "f" 'narrow-to-defun)
    (define-key map "r" 'narrow-to-region)
    (define-key map "w" 'widen)
    map))
(defalias 'custom-narrow-prefix custom-narrow-keymap)

(with-eval-after-load 'evil-leader
  (evil-leader/set-key
    "n" 'custom-narrow-prefix))


;;; init-misc.el ends here

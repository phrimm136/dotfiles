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
(with-eval-after-load 'evil-leader
  (evil-leader/set-key
    "nf" 'narrow-to-defun
    "nr" 'narrow-to-region
    "nw" 'widen))


;;; init-misc.el ends here

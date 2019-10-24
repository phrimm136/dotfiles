;;; package --- summary:
;;; Commentary:
;;; Code:


;;; just one press for yes or no

(fset 'yes-or-no-p 'y-or-n-p)


;;; Trim trailing whitespaces when saving files.

(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;; no tabs

(setq-default indent-tabs-mode nil)


;;; init-misc.el ends here

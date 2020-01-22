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

(setq-default backup-directory-alist '((".*" . "~/.emacs.d/backups/"))
              auto-save-file-name-transforms '((".*" "~/.emacs.d/backups/" t)))


;;; narrow codes

(put 'narrow-to-region 'disabled nil)

(defvar custom-narrow-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "f" 'narrow-to-defun)
    (define-key map "r" 'narrow-to-region)
    (define-key map "w" 'widen)
    map))
(defalias 'narrow custom-narrow-keymap)

(with-eval-after-load 'evil-leader
  (evil-leader/set-key
    "n" 'narrow))


;;; smooth scrolling

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      mouse-wheel-scroll-amount '(1 ((shift) . 1)))


;;; No issue link needed

(bug-reference-mode nil)


;;; init-misc.el ends here

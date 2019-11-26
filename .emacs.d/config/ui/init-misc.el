;;; package --- summary:
;;; Commentary:
;;; Code:


;;; no scrollbar

(setq-default scroll-bar-mode nil)
(toggle-scroll-bar nil)


;;; goto-line preview

(leaf goto-line-preview
  :straight t) ; goto-line preview


;;; Line number

(dolist (source-code '(prog-mode-hook org-mode-hook))
  (add-hook source-code
            (lambda ()
              (setq display-line-numbers 'relative))))


;;; eof indicator

(dolist (source-code '(prog-mode-hook org-mode-hook))
  (add-hook source-code
            (lambda ()
              (setq indicate-empty-lines t))))


;;; init-misc.el ends here

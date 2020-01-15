;;; package --- summary:
;;; Commentary:
;;; Code:


;;; no scrollbar

(setq-default scroll-bar-mode nil)
(toggle-scroll-bar nil)


;;; goto-line preview

(leaf goto-line-preview
  :straight t)


;;; For source files

(dolist (editor '(prog-mode-hook org-mode-hook text-mode-hook yaml-mode-hook))
  (add-hook editor
            (lambda ()
              (setq indicate-empty-lines t) ;; Line number
              (setq display-line-numbers 'relative) ;; EOF indicator
              )))


;;; init-misc.el ends here

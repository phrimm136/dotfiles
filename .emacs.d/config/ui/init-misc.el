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

(dolist (editor '(prog-mode-hook org-mode-hook text-mode-hook yaml-mode-hook))
  (add-hook editor
            (lambda ()
              (setq display-line-numbers 'relative))))


;;; eof indicator

(dolist (editor '(prog-mode-hook org-mode-hook text-mode-hook yaml-mode-hook))
  (add-hook editor
            (lambda ()
              (setq indicate-empty-lines t))))


;;; init-misc.el ends here

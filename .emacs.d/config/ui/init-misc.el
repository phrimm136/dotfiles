;;; package --- summary:
;;; Commentary:
;;; Code:


;;; transparency

(set-frame-parameter (selected-frame) 'alpha '(80 80))


;;; font

(add-to-list 'default-frame-alist '(font . "DejaVuSansMono Nerd Font-6"))


;;; goto-line preview

(leaf goto-line-preview
  :ensure t) ; goto-line preview


;;; Line number + current line highlight

(dolist (source-code '(prog-mode-hook org-mode-hook))
  (add-hook source-code
            (lambda ()
              (setq display-line-numbers 'relative))))


;;; no mouse

(setq-default scroll-bar-mode 'nil)
(toggle-scroll-bar -1)
(menu-bar-mode 0)
(tool-bar-mode 0)


;;; init-misc.el ends here

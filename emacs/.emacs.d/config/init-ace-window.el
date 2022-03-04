;;; init-ace-window.el --- configuration for ace-window -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf ace-window
  :straight t
  :setq ((aw-keys . '(?q ?w ?e ?r ?t))
         (aw-dispatch-always . t)
         (aw-ignore-current . nil)
         (aw-display-mode-overlay . t)
         (aw-dispatch-alist . '((?s aw-swap-window "Swap windows")
                                (?m aw-move-window "Move window")
                                (?1 delete-other-windows "Delete other windows")
                                (?2 aw-split-window-vert "Split vert window")
                                (?3 aw-split-window-horz "Split horz window")
                                (?0 aw-delete-window "Delete window"))))
  :config (progn (evil-leader/set-key
                   "w" 'ace-window)))


(provide 'init-ace-window)

;;; init-ace-window.el ends here

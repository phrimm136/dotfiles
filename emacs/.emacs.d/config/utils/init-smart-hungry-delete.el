;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf smart-hungry-delete
  :straight t
  :leaf-defer nil
  :config (progn (smart-hungry-delete-add-default-hooks))
  :bind ((:evil-insert-state-map
          ("S-<backspace>" . smart-hungry-delete-backward-char)
          ("S-<delete>" . smart-hungry-delete-forward-char))))


;;; init-smart-hungry-delete.el ends here

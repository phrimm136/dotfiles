;;; init-undo-tree.el --- configuration for undo-tree -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf undo-tree
  :straight t
  :hook ((prog-mode-hook text-mode-hook) . undo-tree-mode)
  :setq ((undo-tree-enable-undo-in-region . nil))
  :config (progn (evil-leader/set-key
                   "u" 'undo-tree-visualize)))


;;; init-undo-tree.el ends here

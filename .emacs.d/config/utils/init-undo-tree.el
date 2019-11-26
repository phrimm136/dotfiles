;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf undo-tree
  :straight (undo-tree :type git
                       :repo "http://www.dr-qubit.org/git/undo-tree.git")
  :hook ((prog-mode-hook text-mode-hook) . undo-tree-mode)
  :setq ((undo-tree-enable-undo-in-region . nil))
  :config (progn (evil-leader/set-key
                   "u" 'undo-tree-visualize)))


;;; init-undo-tree.el ends here

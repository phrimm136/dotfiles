;;; init-diff.el --- configuration for file diff

;;; Commentary:

;;; Code:


(leaf diff-ediff
  :straight t
  :setq ((ediff-forward-word-function . 'forward-char)
         (ediff-highlight-all-diffs . t)
         (ediff-window-setup-function . 'ediff-setup-windows-plain)
         (ediff-split-window-function . 'split-window-horizontally)))


(provide 'init-diff)

;;; init-diff.el ends here

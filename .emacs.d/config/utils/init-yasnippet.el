;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf yasnippet
  :straight t
  :hook ((prog-mode-hook org-mode-hook) . yas-minor-mode)
  :config (progn (yas-reload-all)
                 (evil-leader/set-key
                   "y" 'yas-insert-snippet)))


;;; init-yasnippet ends here

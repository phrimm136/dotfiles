;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf yasnippet
  :straight t
  :hook (((prog-mode-hook org-mode-hook) . yas-minor-mode)
         (yas-minor-mode-hook . yas-reload-all))
  :config (progn (evil-leader/set-key
                   "y" 'yas-insert-snippet)))


;;; snippets

(leaf yasnippet-snippets
  :straight t)


;;; init-yasnippet ends here

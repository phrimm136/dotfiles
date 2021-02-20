;;; init-yasnippet.el --- configuration for yasnippet -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf yasnippet
  :straight t
  :hook (((prog-mode-hook org-mode-hook) . yas-minor-mode-on)
         (yas-minor-mode-hook . yas-reload-all)))


;;; snippets

(leaf yasnippet-snippets
  :straight t)


;;; init-yasnippet ends here

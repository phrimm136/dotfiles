;;; init-snippet.el --- configuration for snippet -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf yasnippet
  :straight t
  :hook (((prog-mode-hook org-mode-hook) . yas-minor-mode-on)
         (yas-minor-mode-hook . yas-reload-all)))


;;; snippets

(leaf doom-snippets
  :straight (doom-snippets :type git
                           :host github
                           :repo "hlissner/doom-snippets"
                           :files ("*.el" "*")))


(provide 'init-snippet)

;;; init-snippet.el ends here

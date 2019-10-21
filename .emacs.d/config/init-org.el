;;; package --- summary:
;;; Commentary:
;;; Code:


;;; evil keymap

(leaf org
  :ensure t
  :config (progn (setq org-table-convert-region-max-lines 1000000)))

(leaf org-evil
  :ensure t)

;;; like github flavor

(leaf ox-gfm
  :ensure t
  :after org
  :config (progn (setq org-src-fontify-natively t)))


;;; org-ipython integration

(leaf jupyter
  :ensure t)

(quelpa '(ox-ipynb :fetcher github
                   :repo "jkitchin/ox-ipynb"))

(add-to-list 'lsp-language-id-configuration '(jupyter-org-interaction-mode . "ob-ipython"))
(lsp-register-client (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                                      :major-modes '(ob-ipython-mode python-mode)
                                      :server-id 'pyls))


;;; org general settings

(setq org-confirm-babel-evaluate nil
      org-src-tab-acts-natively t)
;; view
(setq org-src-window-setup 'other-window
      org-src-block-faces 'face)
(setq org-startup-folded nil
      org-startup-indented t
      org-startup-truncated t
      org-startup-with-inline-images t
      org-startup-with-latex-preview t)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
;; function
(add-hook 'org-babel-after-execute-hook '(lambda ()
                                           (org-next-block 1))
          'append)
;; babel
(org-babel-do-load-languages 'org-babel-load-languages
                             '((emacs-lisp . t)
                               (shell . t)
                               (org . t)
                               (jupyter . t)))


;;; keymaps

(defvar org-prefix-map (make-sparse-keymap))
;; jupyter for org-babel


;; (defun ob-ipython-initialize-keymap ()
;;   "Initialize keymaps for ipython in org-babel."
;;   )

(provide 'init-org)
;;; init-org.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


;;; evil keymap

(leaf org
  :ensure t
  :leaf-defer t
  :setq ((org-confirm-babel-evaluate . nil)
         (org-src-tab-acts-natively . t)
         ;; view
         (org-src-window-setup . 'other-window)
         (org-src-block-faces . 'face)
         (org-startup-folded . nil)
         (org-startup-indented . t)
         (org-startup-truncated . t)
         (org-startup-with-inline-images . t)
         (org-startup-with-latex-preview . t)
         (org-table-convert-region-max-lines . 1000000))
  :hook ((org-babel-after-execute-hook . (lambda ()
                                           (org-next-block 1)))
         (org-babel-after-execute-hook . 'org-display-inline-images))
  :config (progn (org-babel-do-load-languages 'org-babel-load-languages
                                              '((emacs-lisp . t)
                                                (shell . t)
                                                (org . t)
                                                (jupyter . t)))))

(leaf org-evil
  :ensure t
  :leaf-defer t)


;;; like github flavor

(leaf ox-gfm
  :ensure t
  :leaf-defer t
  :after org
  :setq ((org-src-fontify-natively . t))
  :config ())


;;; org-ipython integration

(leaf jupyter
  :ensure t
  :leaf-defer nil
  :setq ((ox-ipynb-kernelspecs . 'ipython))
  :config (progn (quelpa '(ox-ipynb :fetcher github
                                    :repo "jkitchin/ox-ipynb"))
                 (add-to-list 'lsp-language-id-configuration '(jupyter-org-interaction-mode . "ob-ipython"))
                 (lsp-register-client (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                                                       :major-modes '(ob-ipython-mode python-mode)
                                                       :server-id 'pyls))
                 (with-eval-after-load "jupyter"
                   (setq ox-ipynb-images jupyter-org-resource-directory))))




;;; keymaps

(defvar org-prefix-map (make-sparse-keymap))
;; jupyter for org-babel

(defun ob-ipython-initialize-keymap ()
  "Initialize keymaps for ipython in org-babel."
  )


;;; init-org.el ends here

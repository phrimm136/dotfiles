;;; package --- summary:
;;; Commentary:
;;; Code:


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
         (org-babel-after-execute-hook . org-display-inline-images))
  :config (progn (org-babel-do-load-languages 'org-babel-load-languages
                                              '((emacs-lisp . t)
                                                (shell . t)
                                                (org . t)
                                                (jupyter . t)))))

(leaf org-evil
  :ensure t
  :after org
  :leaf-defer nil)


;;; like github flavor

(leaf ox-gfm
  :ensure t
  :after org
  :leaf-defer nil
  :setq ((org-src-fontify-natively . t))
  :config ())


;;; org-jupyter integration

(leaf jupyter
  :ensure t
  :after org
  :leaf-defer nil
  :config (progn (with-eval-after-load "jupyter"
                   (setq ox-ipynb-images jupyter-org-resource-directory))))

(leaf ox-ipynb
  :ensure t
  :after org
  :init (progn (quelpa '(ox-ipynb :fetcher github
                                  :repo "jkitchin/ox-ipynb"))
               (require 'ox-ipynb)))

(defun org-babel-edit-prep:jupyter (babel-info)
  "Prepare the local buffer environment for Org source block."
  (let* ((params (nth 2 babel-info))
         (session (alist-get :session params))
         (client-buffer (org-babel-jupyter-initiate-session session params)))
    (jupyter-repl-associate-buffer client-buffer)
    (when (jupyter-tramp-file-name-p session)
      (setq default-directory (concat (file-remote-p session) "/")))
    (setq-local buffer-file-name (or (->> babel-info caddr (alist-get :file)) buffer-file-name))
    (setq-local lsp-buffer-uri (lsp--path-to-uri buffer-file-name))
    (lsp-python-enable)))


;;; keymap

(defvar org-prefix-map (make-sparse-keymap))
;; jupyter for org-babel

(defun ob-ipython-initialize-keymap ()
  "Initialize keymaps for ipython in org-babel."
  )


;;; init-org.el ends here

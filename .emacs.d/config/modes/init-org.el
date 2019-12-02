;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf org
  :straight t
  :setq ((org-confirm-babel-evaluate . nil)
         (org-src-tab-acts-natively . t)
         (org-src-fontify-natively . t)
         ;; view
         (org-src-window-setup . 'other-window)
         (org-src-block-faces . 'face)
         (org-startup-folded . nil)
         (org-startup-indented . t)
         (org-startup-truncated . t)
         (org-startup-with-inline-images . t)
         (org-startup-with-latex-preview . t)
         (org-table-convert-region-max-lines . 1000000))
  :hook ((org-babel-after-execute-hook . org-display-inline-images))
  :config (progn (org-babel-do-load-languages 'org-babel-load-languages
                                              '((emacs-lisp . t)
                                                (shell . t)
                                                (org . t)
                                                (jupyter . t)
                                                (latex . t)))))

(eval-when-compile
  (defun org-ctrl-c-ctrl-c-move-next ()
    "Move to next block after org-ctrl-c-ctrl-c."
    (interactive)
    (org-ctrl-c-ctrl-c)
    (org-next-block 1)))


;;; evil keymap

(leaf org-evil
  :straight t
  :after org
  :leaf-defer nil)


;;; sticky header

;; (leaf org-sticky-header
;;   :straight t
;;   :hook ((org-mode-hook . org-sticky-header-prefix)))


;;; export github flavored markdown

(leaf ox-gfm
  :straight t
  :after org
  :leaf-defer nil
  :config ())


;;; org-jupyter integration

(leaf jupyter
  :straight t
  :after org)

;;; To use virtual env with emacs-jupyter. make a venv kernel by typing
;;; /path/to/virtualenv/bin/python -m ipykernel install --name some-name --display-name some-dis-name
;;; in a virtualenv, then execute jupyter-run-repl and choose the kernel

(leaf ox-ipynb
  :straight (ox-ipynb :type git
                      :host github
                      :repo "jkitchin/ox-ipynb")
  :after org jupyter
  :init (progn (require 'ox-ipynb)
               (setq ox-ipynb-images jupyter-org-resource-directory)))

;;; To integrate jupyter with lsp, you should put :file-name argument into a code block.
;;; See snippets/org-mode/jupyter block.

(defun org-babel-edit-prep:jupyter-python (babel-info)
  "Prepare the local buffer environment for Org source block."
  (let* ((params (nth 2 babel-info))
         (session (alist-get :session params))
         (client-buffer (org-babel-jupyter-initiate-session session params))
         (lsp-file (or (->> babel-info caddr (alist-get :file))
                       buffer-file-name)))
    (jupyter-repl-associate-buffer client-buffer)
    (when (jupyter-tramp-file-name-p session)
      (setq default-directory (concat (file-remote-p session) "/")))
    (setq-local buffer-file-name lsp-file)
    (setq-local lsp-buffer-uri (lsp--path-to-uri buffer-file-name))
    (lsp-python-enable)))


;;; org-LaTeX integration

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted")) ;; need to install pygmentize - reminder
(setq org-latex-listings 'minted
      org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


;;; keymap

(defvar custom-org-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<RET>") 'org-ctrl-c-ctrl-c-move-next)
    map))
(defalias 'org custom-org-keymap)

(evil-leader/set-key-for-mode 'org-mode
  "<SPC>" 'org)

;; jupyter keymap for org-babel

(defun ob-jupyter-initialize-keymap ()
  "Initialize keymaps for jupyter in org-babel."
  )


;;; init-org.el ends here

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
         (org-babel-min-lines-for-block-output . 10000000)
         (org-table-convert-region-max-lines . 1000000))
  :hook ((org-babel-after-execute-hook . org-display-inline-images))
  :config (progn (org-babel-do-load-languages 'org-babel-load-languages
                                              '((emacs-lisp . t)
                                                (shell . t)
                                                (org . t)
                                                (ein . t)
                                                (latex . t)))))

(eval-when-compile
  (defun org-ctrl-c-ctrl-c-move-next ()
    "Move to next block after org-ctrl-c-ctrl-c."
    (interactive)
    (org-ctrl-c-ctrl-c)
    (org-next-block 1)))


;;; sticky header

;; (leaf org-sticky-header
;;   :straight t
;;   :hook ((org-mode-hook . org-sticky-header-prefix)))


;;; export github flavored markdown

(leaf ox-gfm
  :straight t
  :after ox
  :require t)


;;; org-jupyter integration

;; (leaf jupyter
;;   :straight t
;;   :after org)

;; To use virtual env with emacs-jupyter. make a venv kernel by typing
;; /path/to/virtualenv/bin/python -m ipykernel install --name proper-name --display-name proper-display-name --user
;; in a virtualenv, then execute jupyter-run-repl and choose the kernel.
;; Or you can choose the kernel with :kernel block parameter.

(leaf ox-ipynb
  :after ox
  :straight (ox-ipynb :type git
                      :host github
                      :repo "jkitchin/ox-ipynb")
  :require t
  :setq ((ox-ipynb-images . "./jupyter")))

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

(leaf ox-latex
  :after ox
  :setq ((org-latex-listings . 'minted)
         (org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                                  "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                                  "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))
  :config (progn (with-eval-after-load 'ox-latex
                   (add-to-list 'org-latex-packages-alist '("" "minted")))
                 ;; need to install pygmentize - reminder
                 ))


;;; org-hugo integration

(leaf ox-hugo
  :straight t
  :after ox)


;;; evil keymap

(leaf org-evil
  :straight t
  :after org
  :init (require 'org-evil))



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

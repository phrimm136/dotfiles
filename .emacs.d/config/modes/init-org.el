;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf org
  :ensure t
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

(defun org-ctrl-c-ctrl-c-move-next ()
  "Move to next block after org-ctrl-c-ctrl-c."
  (interactive)
  (org-ctrl-c-ctrl-c)
  (org-next-block 1))


;;; evil keymap

(leaf org-evil
  :ensure t
  :after org
  :leaf-defer nil)


;;; sticky header

;; (leaf org-sticky-header
;;   :ensure t
;;   :hook ((org-mode-hook . org-sticky-header-prefix)))


;;; export github flavored markdown

(leaf ox-gfm
  :ensure t
  :after org
  :leaf-defer nil
  :config ())


;;; org-jupyter integration

(leaf jupyter
  :ensure t
  :after org)

(leaf ox-ipynb
  :ensure t
  :after org
  :init (progn (quelpa '(ox-ipynb :fetcher github
                                  :repo "jkitchin/ox-ipynb"))
               (require 'ox-ipynb)
               (with-eval-after-load 'jupyter
                 (setq ox-ipynb-images jupyter-org-resource-directory))))

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


;;; org-LaTeX integration

(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted")) ;; need to install pygmentize - reminder
(setq org-latex-listings 'minted
      org-latex-pdf-process '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                              "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


;;; keymap

(defvar org-custom-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<RET>") 'org-ctrl-c-ctrl-c-move-next)
    map))
(defalias 'org-custom-prefix org-custom-keymap)

(evil-leader/set-key-for-mode 'org-mode
  "<SPC>" org-custom-keymap)

;; jupyter keymap for org-babel

(defun ob-jupyter-initialize-keymap ()
  "Initialize keymaps for jupyter in org-babel."
  )


;;; init-org.el ends here

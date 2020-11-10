;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf org
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
  :after ox
  :require t
  :setq ((org-hugo-date-format . "%Y-%m-%dT%T")
         (org-hugo-suppress-lastmod-period . 86400.0)))


;;; evil keymap

(leaf evil-org
  :straight t
  :after org
  :require evil-org-agenda
  :hook ((org-mode-hook . evil-org-mode)
         (evil-org-mode-hook . (lambda ()
                                 (evil-org-set-key-theme))))
  :config (evil-org-agenda-set-keys))


;;; keymap

(defvar custom-org-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<RET>") 'org-ctrl-c-ctrl-c-move-next)
    map))
(defalias 'org custom-org-keymap)

(evil-leader/set-key-for-mode 'org-mode
  "<SPC>" 'org)


;;; init-org.el ends here

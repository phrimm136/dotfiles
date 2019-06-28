;;; package --- summary:
;;; Commentary:
;;; Code:


;;; clean major/minor mode

(defvar mode-line-cleaner-alist
  '(;; minor-mode
    (aggressive-indent-mode . " ")
    (abbrev-mode . " ")
    (auto-revert-mode . " ")
    (company-mode . " ")
    (undo-tree-mode . " ")
    (eldoc-mode . " ")
    (abbrev-mode . " ")
    (ivy-mode . " ")
    (which-key-mode . " ")
    (workgroups-mode . " ")
    (evil-org-mode . " ")
    (smartparens-mode . " ")
    (evil-smartparens-mode . " ")
    (highlight-indent-guides-mode . " ")

    ;; major-mode
    (c-mode . "C")
    (c++-mode . "C++")
    (python-mode . "Python")
    (inferior-python-mode . "[Python]")
    (ein:notebook-multilang-mode . "iPython")
    (ein:notebooklist-mode . "iPython-notebooklist")
    (eshell-mode . "[Eshell]")
    (ess-julia-mode . "Julia")
    (inferior-ess-julia-mode . "[Julia]")
    (pdf-view-mode . "PDF")
    (emacs-lisp-mode . "Elisp")
    (lisp-interaction-mode . "[Lisp]")))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook  'clean-mode-line)


;;;

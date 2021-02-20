;;; init-dired.el --- configuration for prompt -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; more readable dired

(setq dired-listing-switches "-aBlhv")


;;; filtering and sorting files and subdirectories

(leaf dired-filter
  :straight t
  :hook ((dired-mode-hook . dired-filter-group-mode))
  :setq ((dired-filter-group-saved-groups . '(("default"
                                               ("Code"
                                                (extension "py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"
                                                           "asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go"
                                                           "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" "java" "jl" "scm"
                                                           "sh"))
                                               ("Document"
                                                (extension "pdf" "docx"))
                                               ("Markdown"
                                                (extension "org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
                                               ("Archives"
                                                (extension "zip" "rar" "gz" "bz2" "tar")))))))


;;; integrate ranger feature

(leaf dired-ranger
  :straight t
  :config (progn (evil-define-key 'normal dired-mode-map
                   "C" 'dired-ranger-copy
                   "P" 'dired-ranger-paste
                   "M" 'dired-ranger-move)))


;;; direct access to only file/subdirectory in a directory

(leaf dired-collapse
  :straight t
  :hook ((dired-mode-hook . dired-collapse-mode)))


;;; show git info

(leaf dired-git-info
  :straight t
  :setq ((dgi-auto-hide-details-p . nil))
  :config (progn (evil-define-key 'normal dired-mode-map
                   ")" 'dired-git-info-mode)))


;;; init-dired.el ends here

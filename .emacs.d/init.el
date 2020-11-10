;;; package --- summary:
;;; Commentary:
;;; Code:


(setq gc-cons-threshold (* 50 1000 1000))


(setq straight-repository-branch "develop")
(defvar bootstrap-version)
(let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
                                    'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-fix-org nil) ;; Solved on 28 version
(straight-use-package 'benchmark-init)
(benchmark-init/activate)
(straight-use-package 'leaf)
(straight-use-package 'leaf-keywords)
(leaf-keywords-init)


;;; Set load pathes and load configures.

(defun load-directory (dir)
  "Load all Emacs Lisp files in DIR."
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(defvar base-path (expand-file-name "config/base" user-emacs-directory))
(defvar utils-path (expand-file-name "config/utils" user-emacs-directory))
(defvar modes-path (expand-file-name "config/modes" user-emacs-directory))
(defvar term-path (expand-file-name "config/term" user-emacs-directory))
(defvar visual-path (expand-file-name "config/visual" user-emacs-directory))

(load-directory base-path)
(load-directory utils-path)
(load-directory modes-path)
(load-directory term-path)
(load-directory visual-path)

(kill-buffer "*scratch*")
(kill-buffer "*Messages*")
;; To hook functions to message buffer correctly, I had to kill it and leave it opened again.
;; Weird method, losing startup log but simple.


(setq gc-cons-threshold 800000)


;;; init.el ends here

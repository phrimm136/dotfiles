;;; init.el --- initialize emacs configurations -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(setq gc-cons-threshold (* 50 1000 1000))


(defvar straight-repository-branch "develop")
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

(setq straight-fix-org nil ;; Solved on 28 version
      straight-check-for-modifications nil)
;; (straight-use-package 'benchmark-init)
;; (benchmark-init/activate)
(straight-use-package 'leaf)
(straight-use-package 'leaf-keywords)
(leaf-keywords-init)


;;; Set load pathes and load configurations.

(add-to-list 'load-path "~/.emacs.d/config/")

;;; general config
(require 'init-modeline)
(require 'init-evil)
(require 'init-library)
(require 'init-theme)
(require 'init-lsp)
(require 'init-flycheck)
(require 'init-git)
(require 'init-completion)
(require 'init-projectile)
(require 'init-dashboard)
(require 'init-visual-regexp)
(require 'init-spell-fu)
(require 'init-parens)
(require 'init-highlight)
(require 'init-undo-tree)
(require 'init-which-key)
(require 'init-ace-window)
                                        ;(require 'init-counsel)
(require 'init-M-x)
(require 'init-eaf)
(require 'init-feed)

;;; modes-specific config
(require 'init-ccommon)
(require 'init-python)
(require 'init-clojure)
(require 'init-julia)
(require 'init-latex)
(require 'init-org)
(require 'init-yaml)

(setq gc-cons-threshold 800000)


;;; init.el ends here

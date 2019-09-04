;;; package --- summary:
;;; Commentary:
;;; Code:


(require 'package)
(setq package-enable-at-startup nil)


(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))


(package-initialize)


(setq gc-cons-threshold '100000000)

(unless (package-installed-p 'leaf)
  (package-refresh-contents)
  (package-install 'leaf))
(eval-when-compile
  (require 'leaf))

(require 'bind-key)

(benchmark-init/activate)


(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(require 'init-global)
(require 'init-ccommon)
(require 'init-cpp)
(require 'init-python)
(require 'init-ipython)
(require 'init-julia)
(require 'init-clojure)
(require 'init-pdf)
(require 'init-markdown)
(require 'init-org)
(require 'init-keymap)
;; (load-file "~/.emacs.d/config/default.el")
;; (load-file "~/.emacs.d/config/ccommon.el")
;; (load-file "~/.emacs.d/config/cpp.el")
;; (load-file "~/.emacs.d/config/python.el")
;; (load-file "~/.emacs.d/config/ipython.el")
;; (load-file "~/.emacs.d/config/julia.el")
;; (load-file "~/.emacs.d/config/clojure.el")
;; (load-file "~/.emacs.d/config/pdf.el")
;; (load-file "~/.emacs.d/config/markdown.el")
;; (load-file "~/.emacs.d/config/org.el")
;; (load-file "~/.emacs.d/config/keymap.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8520b58ec652f478aea1de64acdfc1e8fd704bfce9e88f0817e12e4b722a6789" default)))
 '(package-selected-packages
   (quote
    (ein benchmark-init clojure-snippets goto-line-preview company-math fasd ivy-rtags counsel stickyfunc-enhance sr-speedbar function-args evil-mc yasnippet-snippets company-tabnine evil-multiedit flycheck-clang-analyzer cider-decompile clj-refactor clojure-project-mode clojure-project flycheck-clojure clojure-mode hide-mode-line leaf evil-collection company-quickhelp highlight-indent-guides evil-leader cmake-font-lock modern-cpp-font-lock dimmer dired-icon eldoc-cmake csv-mode rainbow-delimiters color-identifiers-mode highlight-function-calls ox-gfm evil-org company-cmake company-auctex auctex markdown-preview-mode markdown-mode quick-preview mode-icons flycheck-pos-tip aggressive-indent projectile tabbar which-key evil-nerd-commenter iedit auto-virtualenvwrapper ess flycheck-julia quelpa julia-mode evil-magit magit dired-subtree pdf-tools workgroups2 company-c-headers ipython surround evil-surround virtualenvwrapper project-explorer workgroups pyvirtualenv company-jedi bind-key jedi flycheck-clang-tidy flycheck-rtags flycheck highlight-numbers undo-tree evil highlight-parentheses company-rtags smex disaster company color-theme cmake-mode cmake-ide clang-format all-the-icons))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here

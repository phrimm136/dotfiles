;;; package --- summary:
;;; Commentary:
;;; Code:


(require 'package)
(setq package-enable-at-startup nil)


(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'leaf)
  (package-refresh-contents)
  (package-install 'leaf))
(eval-when-compile
  (require 'leaf))

(require 'bind-key)

(benchmark-init/activate)


;; Set load pathes and load configures.

(defun load-directory (dir)
  "Load all Emacs Lisp files in DIR."
  (let ((load-it (lambda (f)
		   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(defvar base-path (expand-file-name "config/base" user-emacs-directory))
(defvar utils-path (expand-file-name "config/utils" user-emacs-directory))
(defvar modes-path (expand-file-name "config/modes" user-emacs-directory))
(defvar term-path (expand-file-name "config/term" user-emacs-directory))
(defvar ui-path (expand-file-name "config/ui" user-emacs-directory))

(load-theme 'black t)
(load-directory base-path)
(load-directory utils-path)
(load-directory modes-path)
(load-directory term-path)
(load-directory ui-path)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes '(default))
 '(package-selected-packages
   '(pip-requirements eldoc-overlay lsp-yaml rainbow-mode flycheck-yamllint flycheck-pycheckers ivy-yasnippet ivy-rich rg ag forge org-preview-html evil-smartparens smartparens dashboard-hackernews dashboard ox-ipynb docker yaml-mode landmark travis flycheck-indicator org jupyter org-evil treemacs-projectile treemacs-magit treemacs-evil treemacs flycheck-clang-tidy clang-format+ ccls neotree company-box company-quickhelp switch-buffer-functions pippel traad counsel-projectile lsp-ivy flycheck-cmake cmake-compile-commands lsp-ui benchstat quick-peek flycheck-inline lsp-java dap-mode ivy-smex lsp-julia company-lsp modern-cpp-font-lock modern-c++-font-lock ein benchmark-init clojure-snippets goto-line-preview company-math fasd counsel evil-mc yasnippet-snippets evil-multiedit flycheck-clang-analyzer cider-decompile clj-refactor clojure-project-mode clojure-project flycheck-clojure clojure-mode hide-mode-line evil-collection evil-leader cmake-font-lock dired-icon eldoc-cmake csv-mode rainbow-delimiters color-identifiers-mode highlight-function-calls ox-gfm company-cmake company-auctex auctex markdown-preview-mode markdown-mode quick-preview mode-icons aggressive-indent which-key evil-nerd-commenter iedit auto-virtualenvwrapper ess flycheck-julia quelpa evil-magit magit dired-subtree workgroups2 company-c-headers ipython surround evil-surround virtualenvwrapper project-explorer pyvirtualenv bind-key pdf-tools highlight-numbers evil highlight-parentheses smex disaster flycheck company color-theme cmake-mode cmake-ide clang-format all-the-icons leaf)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here

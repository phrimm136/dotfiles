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
 '(custom-safe-themes
   '("4aa2dc53d15703917bd20066292e5c69618612a37be3d97d72ce9bb7451783b1" "b67ea5a547e21c9cfe37e4d5179b7bb21e60f8cc367dd0e12874b4473bf30609" "486bb87c872505bfda4081843eb9991d5a9246c509320f68330416f7c3d4c2d0" "811c89372d9ab3bc1abdff1170cc5f357053ffffd2fbcd798be25824fd79c806" "0bda91b2ccb8debb1e53fd496baf5d9bb801b577423a7ccf3a4cc3da9f577ff1" "833f1f07e21b793a7a1eb694c7799eb8983060c027e5af05a2e8dfb5b76a6e61" "91a772f229717d4ec99fe24e2b8331f2b561f88ca4b28bf2c2afa52bdbdce8c6" "ebc0afb307bc2813d71518ece6037e3e9fd285b5154fcecb29bc49f88e5e6e63" "2a7c5b05114b5f0919cb7a0e6c9762a070f16ea9d70620c972968bd85284e690" "d26b0dce47e5c63d7f5c62e164a10f5e5857985acb166412e2dc64ba14b91f63" "7b1202daaaa1814e7f430e6edffc3422b07f1b31abb749a813176661278bc6ce" "3822c1c6f2be5cc7a59a991b8baa6ca7dc8fd6fe10d94a49d5661624c887ebdc" "aa1cb3b7a662ab214cdbad3f51c4c1805035fdb7058b547e7945f253b838a599" "b7aa0ead24218355a26d91a5d690dae0423a6399cc4b16518c64cccf7c3cf6af" default))
 '(package-selected-packages
   '(landmark travis flycheck-indicator org jupyter org-evil flycheck-clang-tidy clang-format+ ccls neotree company-box company-quickhelp highlight-indent-guides switch-buffer-functions pippel traad counsel-projectile lsp-ivy flycheck-cmake cmake-compile-commands lsp-ui benchstat quick-peek flycheck-inline lsp-java dap-mode ivy-smex lsp-julia company-lsp modern-cpp-font-lock modern-c++-font-lock ein benchmark-init clojure-snippets goto-line-preview company-math fasd counsel evil-mc yasnippet-snippets evil-multiedit flycheck-clang-analyzer cider-decompile clj-refactor clojure-project-mode clojure-project flycheck-clojure clojure-mode hide-mode-line evil-collection evil-leader cmake-font-lock dired-icon eldoc-cmake csv-mode rainbow-delimiters color-identifiers-mode highlight-function-calls ox-gfm company-cmake company-auctex auctex markdown-preview-mode markdown-mode quick-preview mode-icons aggressive-indent which-key evil-nerd-commenter iedit auto-virtualenvwrapper ess flycheck-julia quelpa evil-magit magit dired-subtree workgroups2 company-c-headers ipython surround evil-surround virtualenvwrapper project-explorer pyvirtualenv bind-key pdf-tools highlight-numbers undo-tree evil highlight-parentheses smex disaster flycheck company color-theme cmake-mode cmake-ide clang-format all-the-icons leaf)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here

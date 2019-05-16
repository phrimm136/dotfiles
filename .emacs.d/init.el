(require 'package)
(setq package-enable-at-startup nil)


(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))


(package-initialize)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(require 'bind-key)


(load-file "~/.emacs.d/config/default.el")
(load-file "~/.emacs.d/config/cmake-ide.el")
(load-file "~/.emacs.d/config/python.el")
(load-file "~/.emacs.d/config/ipython.el")
(load-file "~/.emacs.d/config/julia.el")
(load-file "~/.emacs.d/config/pdf.el")
(load-file "~/.emacs.d/config/keymap.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-mode t)
 '(custom-safe-themes
   (quote
    ("430ca60290b55318a9ac61abae5d927c0497976848f00532398c10bcf661253b" "96c0505b4435f7630865c3910426164ec1f79b57a2acc13949c63e207c0114c3" "3c7708649a6ba0c9329c15a832e2c598a89bb004042b2ffd104c62b3718e5e32" "df7b2f44d2c7cb72da1ece1fe9496a1748f63b6e22668215fc08fb7965271f69" "2ba7585b1fd903876ae85ade074e6e5384fdcb2b94c8ca275611a30caae9a990" "8be17823d1af6964fa6184ad3baa444fef74bfff00adfdb160edf24a093123c4" "34518121b4cf251ef767b20e2362a3436ffbd38633c3be5538cd00d4ac5a0cd6" "4dcfe09889e8b320b973d2ed743b8a1717de33474451d67d2fd2b903647bfb21" "221d65e3687d66ccfdf14aa5b3dd4a777ce2099008c623268ba73eb1ddb83a5c" "72b7ca765f087f4acdbf133535fe27973cc50067d893cc4ac17d1ac8bce24409" "98514295a7c3f37c736b1ed867e44f02276358f941b2981f507aba28c05b4f64" "387a8e58f3152a0bb67d8c58458dd7769a136653b1920e3f45b26f3154e31852" "4a691c3a8e764596ad0571fa2d4040a6f9bc3eb03e66b311ee979e0374e54a90" "9e60eb72677038c49788b5aa2fbd595d5eeb3a1ad5ca07c4bf4603579f24538b" "c64873c763b991286013955ffa1a9424bcc1f25a29a7053bdcff450edfa5ecd3" "df301c1b96dd87d891b91b6dc825ce9bdbac9c12e00676ae29999edc7d06a3bf" "0a88beec943f20050ed431525cd42bf91a8e311121107fec3383545782d8f232" "99b660f20dc7473a8f67d44d142732c156b1a3784c0448189ad9f5b7bbdaad56" "ab00a9b20a276fc4c4c2985da5bdb43f1349c176a6a844e9aba3ef6d037e0117" "55cada6462491af4c51a1c0804216670c735fc7b9399602ead69cfd3d97ba70d" "1f4578ca266e74a38dfbe44f4c7ea2451ffae73428c6cf353a9d088b8e40b714" "79ea3bff542904df9a60c4bb519debc0e6360d63927b8dea406a7ae18b17d255" "88a4f5b22ac6ffb36b8de3fcf67cb5292ff3db2034e3cc99cd374c1970cebc7a" "9563c6415a6c612c135b938389506c556adacb65248d80d58db7c7f75f4b06e5" "fade79888b3bae55aa5dd97c586a6036bec658dc9609c53ec567c1466fd2f633" "cbd31fbfd87e24150e4ae47f8e525884c69b6e9a7b8e11c8517b3085b80665cf" "cf20932e3ed6575e716b1beee095b474c1d8b80e41be4aa55b80d1b88c9cce8d" "dabeb64985f25253ebe5abb7898478bd3f8f2eaa02c8e621ad2e99799d585259" "e44eb9180b6c709639d00c5fa5f3f747379d817c06330ce9e0d19082a5f44dd4" "f05371089060ed2cd86a31a1d2e7bad2a71d24365f2b8d1f7f9b45d9d87de869" "d743c617356b2ad0c58eee740c8e39ab800bd110b7c10ba1b011fd33ad8fc529" "82bcf832d2ccde347424476282646da25c4654b943c928a09d7d8ef449750781" "7bd020db8a92c476ab6987cf940f64bfb560ac3287b753db5147db82268081a3" "04a562814e089173098f3ef2e4ebd9b711aa42bf3ab3bead5b8c6a6ff22a6983" "b4823852ac04cb9c30c1569524983aeb69d76494d5d2d6601496b3e63789a676" default)))
 '(package-selected-packages
   (quote
    (auto-virtualenvwrapper ess flycheck-julia company-quickhelp quelpa julia-mode evil-magit magit dired-subtree fasd flx-ido counsel pdf-tools workgroups2 company-c-headers ein ipython surround evil-surround virtualenvwrapper project-explorer workgroups pyvirtualenv company-jedi bind-key jedi flycheck-clang-tidy flycheck-rtags flycheck highlight-numbers undo-tree evil highlight-parentheses company-rtags use-package smex ivy-rtags helm disaster company color-theme cmake-mode cmake-ide clang-format auto-complete all-the-icons)))
 '(wg-workgroups-mode-exit-save-behavior nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;

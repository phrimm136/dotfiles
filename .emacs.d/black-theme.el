;;; black-theme.el --- Theme

;; Copyright (C) 2019 hankail05

;; Created with ThemeCreator, https://github.com/mswift42/themecreator.


;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

(deftheme black)
(let ((class '((class color) (min-colors 89)))
      (fg1      "#ffffff")
      (fg2      "#dedede")
      (fg3      "#b3b3b3")
      (fg4      "#808080")
      (bg1      "#000000")
      (bg2      "#181818")
      (bg3      "#262626")
      (bg4      "#343434")
      (bg5      "#424242")
      (builtin  "#00ff00")
      (keyword  "#ff0000")
      (const    "#00ffff")
      (comment  "#8b8b8b")
      (func     "#00ff00")
      (str      "#ffff00")
      (type     "#ff4300")
      (var      "#ff00ff")
      (warning  "#ff0000")
      (warning2 "#00ff00")
      (dir      "#aebdf9")
      (etc1     "#00ffff")
      (etc2     "#00b8ff")
      (etc3     "#0070ff")
      (etc4     "#0a48ff"))
  (custom-theme-set-faces
   'black
   `(default ((,class (:background ,bg1 :foreground ,fg1))))
   `(font-lock-builtin-face ((,class (:foreground ,builtin))))
   `(font-lock-comment-face ((,class (:foreground ,comment))))
   `(font-lock-negation-char-face ((,class (:foreground ,const))))
   `(font-lock-reference-face ((,class (:foreground ,const))))
   `(font-lock-constant-face ((,class (:foreground ,const))))
   `(font-lock-doc-face ((,class (:foreground ,comment))))
   `(font-lock-function-name-face ((,class (:foreground ,func))))
   `(font-lock-keyword-face ((,class (:bold ,class :foreground ,keyword))))
   `(font-lock-string-face ((,class (:foreground ,str))))
   `(font-lock-type-face ((,class (:foreground ,type ))))
   `(font-lock-variable-name-face ((,class (:foreground ,var))))
   `(font-lock-preprocessor-face ((,class (:foreground ,keyword))))
   `(font-lock-warning-face ((,class (:foreground ,warning))))
   `(vertical-border ((,class (:foreground ,bg4 :background ,bg2))))
   `(minibuffer-prompt ((,class (:bold t :foreground ,fg1))))
   `(default-italic ((,class (:italic t))))
   `(link ((,class (:foreground ,const :underline t))))
   `(region ((,class (:extend t :background ,bg4))))
   `(next-error ((,class (:extend t :inherit region))))
   `(highlight ((,class (:extend t :background ,bg4))))
   `(secondary-selection ((,class (:extend t :background ,bg4))))
   `(fringe ((,class (:background ,bg2))))
   `(hl-line ((,class (:extend t :background ,bg3))))
   `(line-number ((,class (:foreground ,fg3 :background ,bg2))))
   `(line-number-current-line ((,class (:foreground ,fg1 :background ,bg3))))
   `(fringe ((,class (:foreground ,fg2))))
   `(cursor ((,class (:background ,fg1))))
   `(show-paren-match ((,class (:background ,fg3 :foreground ,bg1))))
   `(show-paren-mismatch ((,class (:background ,bg1))))
   `(show-paren-matchface ((,class (:background ,warning))))
   `(isearch ((,class (:bold t :foreground ,bg1 :background ,fg1))))
   `(ivy-current-match ((,class (:extend t :foreground ,bg1 :background ,fg1))))
   `(ivy-org ((,class (:extend t :inherit org-level-3))))
   `(swiper-line-face ((,class (:extend t :inherit highlight))))
   `(mode-line ((,class (:bold t :foreground ,fg1 :background ,bg3))))
   `(mode-line-inactive ((,class (:foreground ,fg3 :background ,bg2 :weight normal))))
   `(mode-line-buffer-id ((,class (:bold t :background nil))))
   `(mode-line-highlight ((,class (:weight bold))))
   `(mode-line-emphasis ((,class (:foreground ,fg1))))
   `(which-key-key-face ((,class (:foreground ,fg1))))
   `(which-key-group-description-face ((,class (:foreground ,dir))))
   `(which-key-command-description-face ((,class (:foreground ,etc1))))
   `(org-code ((,class (:foreground ,fg1))))
   `(org-hide ((,class (:foreground ,fg4))))
   `(org-level-1 ((,class (:bold t :foreground ,fg2 :height 1.1))))
   `(org-level-2 ((,class (:bold nil :foreground ,fg3))))
   `(org-level-3 ((,class (:bold t :foreground ,fg4))))
   `(org-level-4 ((,class (:bold nil :foreground ,bg4))))
   `(org-date ((,class (:underline t :foreground ,var))))
   `(org-footnote  ((,class (:underline t :foreground ,fg4))))
   `(org-link ((,class (:underline t :foreground ,type))))
   `(org-special-keyword ((,class (:foreground ,func))))
   `(org-block ((,class (:extend t :background ,bg4 :foreground ,fg1))))
   `(org-quote ((,class (:inherit org-block :slant italic))))
   `(org-verse ((,class (:inherit org-block :slant italic))))
   `(org-todo ((,class (:box (:line-width 1 :color ,fg3) :foreground ,keyword :bold t))))
   `(org-done ((,class (:box (:line-width 1 :color ,bg4) :foreground ,const :bold t))))
   `(org-warning ((,class (:underline t :foreground ,warning))))
   `(org-agenda-structure ((,class (:weight bold :foreground ,fg3 :box (:color ,fg4) :background ,bg4))))
   `(org-agenda-date ((,class (:foreground ,var :height 1.1))))
   `(org-agenda-date-weekend ((,class (:weight normal :foreground ,fg4))))
   `(org-agenda-date-today ((,class (:weight bold :foreground ,keyword :height 1.4))))
   `(org-agenda-done ((,class (:foreground ,bg4))))
   `(org-scheduled ((,class (:foreground ,type))))
   `(org-scheduled-today ((,class (:foreground ,func :weight bold :height 1.2))))
   `(org-ellipsis ((,class (:foreground ,builtin))))
   `(org-verbatim ((,class (:foreground ,fg4))))
   `(org-document-info-keyword ((,class (:foreground ,func))))
   `(org-sexp-date ((,class (:foreground ,fg4))))
   `(font-latex-bold-face ((,class (:foreground ,type))))
   `(font-latex-italic-face ((,class (:foreground ,var :italic t))))
   `(font-latex-string-face ((,class (:foreground ,str))))
   `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
   `(font-latex-match-variable-keywords ((,class (:foreground ,var))))
   `(gnus-header-content ((,class (:foreground ,keyword))))
   `(gnus-header-from ((,class (:foreground ,var))))
   `(gnus-header-name ((,class (:foreground ,type))))
   `(gnus-header-subject ((,class (:foreground ,func :bold t))))
   `(mu4e-view-url-number-face ((,class (:foreground ,type))))
   `(mu4e-cited-1-face ((,class (:foreground ,fg2))))
   `(mu4e-cited-7-face ((,class (:foreground ,fg3))))
   `(mu4e-header-marks-face ((,class (:foreground ,type))))
   `(ffap ((,class (:foreground ,fg4))))
   `(js2-private-function-call ((,class (:foreground ,const))))
   `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,str))))
   `(js2-jsdoc-html-tag-name ((,class (:foreground ,var))))
   `(js2-external-variable ((,class (:foreground ,type))))
   `(js2-function-param ((,class (:foreground ,const))))
   `(js2-jsdoc-value ((,class (:foreground ,str))))
   `(js2-private-member ((,class (:foreground ,fg3))))
   `(js3-warning-face ((,class (:underline ,keyword))))
   `(js3-error-face ((,class (:underline ,warning))))
   `(js3-external-variable-face ((,class (:foreground ,var))))
   `(js3-function-param-face ((,class (:foreground ,fg2))))
   `(js3-jsdoc-tag-face ((,class (:foreground ,keyword))))
   `(js3-instance-member-face ((,class (:foreground ,const))))
   `(warning ((,class (:foreground ,warning))))
   `(ac-completion-face ((,class (:underline t :foreground ,keyword))))
   `(info-quoted-name ((,class (:foreground ,builtin))))
   `(info-string ((,class (:foreground ,str))))
   `(icompletep-determined ((,class :foreground ,builtin)))
   `(undo-tree-visualizer-current-face ((,class :foreground ,builtin)))
   `(undo-tree-visualizer-default-face ((,class :foreground ,fg2)))
   `(undo-tree-visualizer-unmodified-face ((,class :foreground ,var)))
   `(undo-tree-visualizer-register-face ((,class :foreground ,type)))
   `(slime-repl-inputed-output-face ((,class (:foreground ,type))))
   `(trailing-whitespace ((,class :foreground nil :background ,warning)))
   `(rainbow-delimiters-depth-1-face ((,class :foreground ,fg1)))
   `(rainbow-delimiters-depth-2-face ((,class :foreground ,type)))
   `(rainbow-delimiters-depth-3-face ((,class :foreground ,var)))
   `(rainbow-delimiters-depth-4-face ((,class :foreground ,const)))
   `(rainbow-delimiters-depth-5-face ((,class :foreground ,keyword)))
   `(rainbow-delimiters-depth-6-face ((,class :foreground ,etc1)))
   `(rainbow-delimiters-depth-7-face ((,class :foreground ,type)))
   `(rainbow-delimiters-depth-8-face ((,class :foreground ,var)))
   `(rainbow-delimiters-unmatched-face ((,class :foreground ,warning)))
   `(lazy-highlight ((,class (:foreground ,bg1 :background ,fg3))))
   `(term ((,class (:foreground ,fg1 :background ,bg1))))
   `(term-color-black ((,class (:foreground "#000000"))))
   `(term-color-blue ((,class (:foreground "#0088ff"))))
   `(term-color-red ((,class (:foreground "#ff0000"))))
   `(term-color-green ((,class (:foreground "#00ff00"))))
   `(term-color-yellow ((,class (:foreground "#ffff00"))))
   `(term-color-magenta ((,class (:foreground "#ff00ff"))))
   `(term-color-cyan ((,class (:foreground "#00ffff"))))
   `(term-color-white ((,class (:foreground "#ffffff"))))
   `(company-echo-common ((,class (:foreground ,bg1 :background ,fg1))))
   `(company-preview ((,class (:foreground ,var :background ,bg3))))
   `(company-preview-common ((,class (:foreground ,fg3 :background ,bg4))))
   `(company-preview-search ((,class (:foreground ,type :background ,bg3))))
   `(company-scrollbar-bg ((,class (:background ,bg4))))
   `(company-scrollbar-fg ((,class (:foreground ,fg1))))
   `(company-tooltip ((,class (:expand t :foreground ,fg4 :background ,bg2 :bold t))))
   `(company-tooltip-annotation ((,class (:expand t :foreground ,const))))
   `(company-tooltip-common ((,class (:expand t :foreground ,fg3))))
   `(company-tooltip-common-selection ((,class (:expand t :foreground ,fg1))))
   `(company-tooltip-mouse ((,class (:expand t :inherit highlight))))
   `(company-tooltip-selection ((,class (:expand t :foreground ,fg3 :background ,bg4))))
   `(company-template-field ((,class (:inherit region))))
   `(neo-dir-link-face ((,class (:foreground ,dir))))
   `(neo-expand-btn-face ((,class (:foreground ,dir))))
   `(treemacs-root-face ((,class (:foreground ,dir :underline t :bold t :height 1.2))))
   `(treemacs-directory-face ((,class (:foreground ,dir))))
   `(treemacs-git-added-face ((,class :foreground ,etc1)))
   `(treemacs-git-modified-face ((,class (:foreground ,etc2))))
   `(treemacs-git-untracked-face ((,class (:foreground ,etc3))))
   `(treemacs-on-failure-pulse-face ((,class (:extend t :foreground "#111111" :background "#ab3737"))))
   `(web-mode-builtin-face ((,class (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((,class (:inherit ,font-lock-constant-face))))
   `(web-mode-keyword-face ((,class (:foreground ,keyword))))
   `(web-mode-doctype-face ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-function-name-face ((,class (:inherit ,font-lock-function-name-face))))
   `(web-mode-string-face ((,class (:foreground ,str))))
   `(web-mode-type-face ((,class (:inherit ,font-lock-type-face))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,func))))
   `(web-mode-html-attr-value-face ((,class (:foreground ,keyword))))
   `(web-mode-warning-face ((,class (:inherit ,font-lock-warning-face))))
   `(web-mode-html-tag-face ((,class (:foreground ,builtin))))
   `(jde-java-font-lock-package-face ((t (:foreground ,var))))
   `(jde-java-font-lock-public-face ((t (:foreground ,keyword))))
   `(jde-java-font-lock-private-face ((t (:foreground ,keyword))))
   `(jde-java-font-lock-constant-face ((t (:foreground ,const))))
   `(jde-java-font-lock-modifier-face ((t (:foreground ,fg2))))
   `(jde-jave-font-lock-protected-face ((t (:foreground ,keyword))))
   `(jde-java-font-lock-number-face ((t (:foreground ,var))))
   `(helm-M-x-key ((,class (:foreground ,keyword))))
   `(helm-candidate-number ((,class (:background ,fg3 :foreground ,bg1))))
   `(helm-buffer-directory ((,class (:foreground "#aebdf9"))))
   `(helm-buffer-file ((,class (:foreground ,fg1))))
   `(helm-buffer-file-name ((,class (:foreground ,fg2))))
   `(helm-buffer-not-saved ((,class (:foreground ,var))))
   `(helm-buffer-process ((,class (:foreground "orange"))))
   `(helm-buffer-saved-out ((,class (:foreground ,keyword))))
   `(helm-ff-directory ((,class (:foreground "#aebdf9"))))
   `(helm-ff-dirs ((,class (:foreground "#cfd8fb"))))
   `(helm-ff-dotted-directory ((,class (:foreground "#aebdf9"))))
   `(helm-ff-dotted-symlink-directory ((,class (:foreground ,const))))
   `(helm-ff-executable ((,class (:foreground ,func))))
   `(helm-ff-file ((,class (:foreground ,fg1))))
   `(helm-ff-invalid-symlink ((,class (:foreground ,const :background ,keyword))))
   `(helm-ff-prefix ((,class (:foreground ,fg1))))
   `(helm-ff-symlink ((,class (:foreground ,const))))
   `(helm-match ((,class (:foreground "#827bce"))))
   `(helm-selection ((,class (:background ,bg3))))
   `(helm-source-header ((,class (:foreground ,fg1 :height 1.3 :weight bold))))
   `(helm-swoop-target-line-face ((,class (:background ,bg4))))
   `(helm-swoop-target-word-face ((,class (:background ,fg1 :foreground ,bg1))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'black)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; black-theme.el ends here

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
      (etc1     "#b0e0e6")
      (etc2     "#87cefa")
      (etc3     "#6495ed")
      (etc4     "#4169e1"))
  (custom-theme-set-faces
   'black
   `(default ((,class (:foreground ,fg1 :background ,bg1))))
   ;;; font locks
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
   ;;; fundamental features
   `(vertical-border ((,class (:foreground ,bg4 :background ,bg2))))
   `(minibuffer-prompt ((,class (:bold t :foreground ,fg1))))
   `(default-italic ((,class (:italic t))))
   `(link ((,class (:foreground ,const :underline t))))
   `(region ((,class (:extend t :background ,bg5))))
   `(highlight ((,class (:extend t :background ,bg4))))
   `(secondary-selection ((,class (:extend t :background ,bg5))))
   `(fringe ((,class (:background ,bg2))))
   `(hl-line ((,class (:extend t :background ,bg3))))
   `(line-number ((,class (:foreground ,fg3 :background ,bg2))))
   `(line-number-current-line ((,class (:foreground ,fg1 :background ,bg3))))
   `(cursor ((,class (:background ,fg1))))
   `(show-paren-match ((,class (:foreground ,bg1 :background ,fg3))))
   `(show-paren-mismatch ((,class (:background ,warning))))
   `(isearch ((,class (:bold t :background ,bg3))))
   `(warning ((,class (:foreground ,warning))))
   `(info-quoted-name ((,class (:foreground ,builtin))))
   `(info-string ((,class (:foreground ,str))))
   `(icompletep-determined ((,class :foreground ,builtin)))
   `(slime-repl-inputed-output-face ((,class (:foreground ,type))))
   `(trailing-whitespace ((,class :foreground nil :background ,warning)))
   `(lazy-highlight ((,class (:foreground ,bg1 :background ,fg3))))
   ;;; mode line
   `(mode-line ((,class (:bold t :foreground ,fg1 :background ,bg3))))
   `(mode-line-inactive ((,class (:foreground ,fg3 :background ,bg2 :weight normal))))
   `(mode-line-buffer-id ((,class (:bold t :background nil))))
   `(mode-line-highlight ((,class (:weight bold))))
   `(mode-line-emphasis ((,class (:foreground ,fg1))))
   ;;; org
   `(org-code ((,class (:foreground ,fg1))))
   `(org-hide ((,class (:foreground ,fg4))))
   `(org-level-1 ((,class (:bold t :foreground ,etc1 :height 1.1))))
   `(org-level-2 ((,class (:bold nil :foreground ,etc2))))
   `(org-level-3 ((,class (:bold t :foreground ,etc3))))
   `(org-level-4 ((,class (:bold nil :foreground ,etc4))))
   `(org-date ((,class (:underline t :foreground ,var))))
   `(org-footnote  ((,class (:underline t :foreground ,fg4))))
   `(org-link ((,class (:underline t :foreground ,type))))
   `(org-special-keyword ((,class (:foreground ,func))))
   `(org-block ((,class (:extend t :foreground ,fg1 :background ,bg4))))
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
   ;;; ivy
   `(ivy-current-match ((,class (:extend t :background ,bg5))))
   ;;; which-key
   `(which-key-key-face ((,class (:foreground ,fg1))))
   `(which-key-group-description-face ((,class (:foreground ,dir))))
   `(which-key-command-description-face ((,class (:foreground ,etc3))))
   ;;; ein
   `(ein:cell-input-area ((,class (:extend t :background ,bg4))))
   ;;; latex
   `(font-latex-bold-face ((,class (:foreground ,type))))
   `(font-latex-italic-face ((,class (:foreground ,var :italic t))))
   `(font-latex-string-face ((,class (:foreground ,str))))
   `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
   `(font-latex-match-variable-keywords ((,class (:foreground ,var))))
   ;;; dired
   `(dired-directory ((,class (:foreground ,dir))))
   `(dired-symlink ((,class (:foreground ,etc1))))
   `(dired-marked ((,class (:foreground ,etc2))))
   `(dired-flagged ((,class (:foreground ,etc3))))
   ;;; undo tree
   `(undo-tree-visualizer-current-face ((,class :foreground ,etc1)))
   `(undo-tree-visualizer-default-face ((,class :foreground ,etc2)))
   `(undo-tree-visualizer-unmodified-face ((,class :foreground ,etc3)))
   `(undo-tree-visualizer-register-face ((,class :foreground ,etc4)))
   ;;; rainbow delimiters
   `(rainbow-delimiters-depth-1-face ((,class :foreground ,fg1)))
   `(rainbow-delimiters-depth-2-face ((,class :foreground ,type)))
   `(rainbow-delimiters-depth-3-face ((,class :foreground ,var)))
   `(rainbow-delimiters-depth-4-face ((,class :foreground ,const)))
   `(rainbow-delimiters-depth-5-face ((,class :foreground ,keyword)))
   `(rainbow-delimiters-depth-6-face ((,class :foreground ,etc1)))
   `(rainbow-delimiters-depth-7-face ((,class :foreground ,type)))
   `(rainbow-delimiters-depth-8-face ((,class :foreground ,var)))
   `(rainbow-delimiters-unmatched-face ((,class :foreground ,warning)))
   ;;; term
   `(term ((,class (:foreground ,fg1))))
   `(term-color-black ((,class (:foreground "#000000"))))
   `(term-color-blue ((,class (:foreground "#0088ff"))))
   `(term-color-red ((,class (:foreground "#ff0000"))))
   `(term-color-green ((,class (:foreground "#00ff00"))))
   `(term-color-yellow ((,class (:foreground "#ffff00"))))
   `(term-color-magenta ((,class (:foreground "#ff00ff"))))
   `(term-color-cyan ((,class (:foreground "#00ffff"))))
   `(term-color-white ((,class (:foreground "#ffffff"))))
   ;;; company
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
   `(company-tooltip-selection ((,class (:expand t :foreground ,fg3 :background ,bg4))))
   ;;; neotree
   `(neo-dir-link-face ((,class (:foreground ,dir))))
   `(neo-expand-btn-face ((,class (:foreground ,dir))))
   ;;; treemacs
   `(treemacs-root-face ((,class (:foreground ,dir :underline t :bold t :height 1.2))))
   `(treemacs-directory-face ((,class (:foreground ,dir))))
   `(treemacs-git-added-face ((,class :foreground ,etc1)))
   `(treemacs-git-modified-face ((,class (:foreground ,etc2))))
   `(treemacs-git-untracked-face ((,class (:foreground ,etc3))))
   `(treemacs-on-failure-pulse-face ((,class (:extend t :foreground "#111111" :background "#ab3737"))))
   ;;; dashboard
   `(dashboard-heading-face ((,class (:foreground ,dir))))
   `(dashboard-text-banner-face ((,class (:foreground ,etc1))))
   `(dashboard-navigator ((,class (:foreground ,etc1))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'black)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; black-theme.el ends here

;;; init-theme.el --- configuration for theme -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; Use theme

(leaf modus-vivendi-theme
  :straight (modus-vivendi-theme :type git
                                 :host gitlab
                                 :repo "protesilaos/modus-themes"
                                 :files ("*.el"))
  :setq ((modus-vivendi-theme-org-blocks . 'rainbow)
         (modus-vivendi-theme-rainbow-headings . t)
         (modus-vivendi-theme-visible-fringes . t)
         (modus-vivendi-theme-slanted-constructs . t)
         (modus-vivendi-theme-3d-modeline . t)
         (modus-vivendi-theme-subtle-diffs . t)
         (modus-vivendi-theme-intense-standard-completions . nil))
  :config (load-theme 'modus-vivendi t))


(provide 'init-theme)

;;; init-theme.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


;;; evil keymap

(use-package org
  :ensure t
  :config (progn (setq org-table-convert-region-max-lines 1000000)))

(use-package evil-org
  :ensure t
  :after org
  :config (progn (add-hook 'org-mode-hook 'evil-org-mode)
                 (add-hook 'evil-org-mode-hook (lambda ()
                                                 (evil-org-set-mode-hook)))
                 (require 'evil-org-agenda)
                 (evil-org-agenda-set-keys)
                 ))


;;; like github flavor

(use-package ox-gfm
  :ensure t
  :after org
  :config (progn (setq org-src-fontify-natively t)))

;;;

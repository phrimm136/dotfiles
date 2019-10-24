;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf company
  :ensure t
  :leaf-defer nil
  :hook ((prog-mode-hook org-mode-hok) . company-mode)
  :setq ((company-idle-delay . 0)
         (company-minimum-prefix-length . 2)
         (company-backends . '(company-files
                               company-keywords
                               company-capf
                               company-yasnippet
                               company-abbrev
                               company-dabbrev))
         (company-echo-truncate-lines . t)
         (company-tooltip-align-annotations . t))
  :config ()
  :bind (:company-active-map
         ("<tab>" . company-complete)))


;; (leaf company-tabnine
;;   :ensure t
;;   :after company
;;   :config (progn (add-to-list 'company-backends 'company-tabnine))) ; 1GB ram for a little time :thinking:


(leaf company-math
  :ensure t
  :after company
  :config (progn (add-to-list 'company-backends 'company-math-symbols-unicode)))


(leaf company-lsp
  :ensure t
  :after company lsp
  :setq ((company-lsp-async . t)
         (company-lsp-cache-candidates . 'auto)
         (company-lsp-match-candidate-predicate . 'company-lsp-match-candidate-prefix))
  :config ())


;; (leaf company-quickhelp
;;   :ensure t
;;   :after company
;;   :hook (company-mode-hook . company-quickhelp-mode)
;;   :setq ((pos-tip-background-color . "#2b2b2b")
;;          (pos-tip-foreground-color . "#ffffff")))


;; (leaf company-box
;;   :ensure t
;;   :after company
;;   :hook (company-mode-hook . company-box-mode)
;;   :setq ((company-box-icons-alist . 'company-box-icons-all-the-icons)
;;          (company-box-show-single-candidate . t)))


;;; init-company.el ends here

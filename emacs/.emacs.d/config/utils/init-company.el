;;; init-company.el --- configuration for company -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf company
  :straight t
  :leaf-defer nil
  :setq ((company-idle-delay . 0)
         (company-minimum-prefix-length . 2)
         (company-backends . '((company-dabbrev-code :separate company-capf company-keywords)
                               company-files
                               company-keywords
                               company-capf
                               company-yasnippet
                               company-abbrev
                               company-dabbrev))
         (company-echo-truncate-lines . t)
         (company-tooltip-align-annotations . t)
         (company-tng-auto-configure . nil))
  :config (progn (global-company-mode t)))


;; (leaf company-tabnine
;;   :straight t
;;   :after company
;;   :config (progn (add-to-list 'company-backends 'company-tabnine))) ; 1GB ram for a little time :thinking:


(leaf company-math
  :straight t)


;; (leaf company-lsp
;;   :straight t
;;   :setq ((company-lsp-async . t)
;;          (company-lsp-cache-candidates . t)
;;          (company-lsp-match-candidate-predicate . 'company-lsp-match-candidate-prefix)
;;          (company-lsp-enable-snippet . t))
;;   :config (progn (add-to-list 'company-backends 'company-lsp)))


;; (leaf company-quickhelp
;;   :straight t
;;   :after company
;;   :hook (company-mode-hook . company-quickhelp-mode))


;; (leaf company-box
;;   :straight t
;;   :hook (company-mode-hook . company-box-mode)
;;   :setq ((company-box-icons-alist . 'company-box-icons-all-the-icons)))


;;; init-company.el ends here

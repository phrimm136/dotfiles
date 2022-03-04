;;; init-company.el --- configuration for company -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; company

;;; Notice that its completion rule is affected by orderless. See init-M-x.el.

(leaf company
  :straight t
  :leaf-defer nil
  :setq ((company-idle-delay . 0)
         (company-minimum-prefix-length . 1)
         (company-backends . '((company-dabbrev-code :separate company-capf company-keywords)
                               company-capf
                               company-files
                               company-keywords
                               company-yasnippet
                               company-abbrev))
         (company-echo-truncate-lines . t)
         (company-tooltip-align-annotations . t)
         (company-tng-auto-configure . t)
         (company-abort-on-unique-match . nil))
  :config (progn (global-company-mode t)))


(leaf company-math
  :straight t)


(provide 'init-completion)

;;; init-completion.el ends here

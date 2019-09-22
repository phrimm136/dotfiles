;;; package --- summary:
;;; Commentary:
;;; Code:


;;; include header file automatically

(quelpa '(cpp-auto-include :fetcher github
                           :repo "syohex/emacs-cpp-auto-include"))
(add-hook 'c++-mode-hook 'cpp-auto-include)


;;; modern c++ font lock

(leaf modern-cpp-font-lock
  :ensure t
  :config (progn (modern-c++-font-lock-global-mode)))


(provide 'init-cpp)
;;; init-cpp.el ends here

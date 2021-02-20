;;; init-cpp.el --- configuration for c++ language -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; modern c++ font lock

(leaf modern-cpp-font-lock
  :straight t
  :hook (c++-mode-hook . modern-c++-font-lock-mode))


;;; init-cpp.el ends here

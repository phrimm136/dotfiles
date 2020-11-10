;;; init-eaf.el --- configuration for eaf

;; Author: hankail05


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;;; Code:

(leaf eaf
  :straight (eaf :type git
                 :host github
                 :repo "manateelazycat/emacs-application-framework"
                 :files ("app" "core" "eaf.py" "eaf.el"))
  :init (require 'eaf)
  :setq ((eaf-find-alternate-file-in-dired . t))
  :config (progn (evil-set-initial-state 'eaf-mode 'emacs)))


(provide 'init-eaf)

;;; init-eaf.el ends here

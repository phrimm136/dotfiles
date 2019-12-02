;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf flycheck
  :straight t
  :hook (prog-mode-hook . flycheck-mode)
  :setq ((flycheck-errors-function . nil)
         (flycheck-idle-change-delay . 0.1)
         (flycheck-display-errors-delay . 0.1))
  :config (progn )
  :bind ((:flycheck-command-map
          ("j" . flycheck-next-error)
          ("k" . flycheck-previous-error))))


;;; inline error message

(leaf flycheck-inline
  :straight t
  :after flycheck quick-peek
  :setq ((flycheck-inline-display-function . (lambda (msg pos)
                                               (let* ((ov (quick-peek-overlay-ensure-at pos))
                                                      (contents (quick-peek-overlay-contents ov)))
                                                 (setf (quick-peek-overlay-contents ov)
                                                       (concat contents (when contents "\n") msg))
                                                 (quick-peek-update ov))))
         (flycheck-inline-clear-function 'quick-peek-hide))
  :config ())
(global-flycheck-inline-mode)


;;; fancy modeline for flycheck

(leaf flycheck-indicator
  :straight t
  :after flycheck
  :config (flycheck-indicator-mode))


;;; keymap

(defalias 'flycheck flycheck-command-map)

(evil-leader/set-key
  "f" 'flycheck)


;;; init-flycheck.el ends here

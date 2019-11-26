;;; package --- summary:
;;; Commentary:
;;; Code:


;; (leaf neotree
;;   :straight t
;;   :leaf-defer nil
;;   :setq ((neo-autorefresh . nil)
;;          (neo-theme . 'ascii))
;;   :config (progn
;;             (evil-define-key 'normal neotree-mode-map
;;               "n" 'neotree-create-node
;;               "f" 'find-file-other-window
;;               "d" 'neotree-delete-node
;;               "e" 'neotree-enter
;;               "p" 'neotree-copy-node
;;               "j" 'neotree-next-line
;;               "k" 'neotree-previous-line
;;               "C-w" 'evil-window-map)))
;; (with-eval-after-load 'neotree
;;   (add-hook 'switch-buffer-functions
;;             (lambda (prev cur)
;;               (neotree-refresh t))))


;;; init-neotree ends here

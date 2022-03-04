;;; init-M-x.el --- configuration for M-x and similar prompts -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; vertico

(leaf vertico
  :straight t
  :init (vertico-mode)
  :setq ((vertico-cycle . t))
  :bind ((:minibuffer-local-map
          ("C-j" . next-line-or-history-element)
          ("C-k" . previous-line-or-history-element))))


;;; orderless

(leaf orderless
  :straight t
  :setq ((completion-styles . '(orderless))
         (orderless-smart-case . t)
         (orderless-matching-styles . '(orderless-prefixes
                                        orderless-initialism
                                        orderless-regexp))))


;;; amx

;; (leaf amx
;;   :straight t
;;   :setq ((amx-save-file . "~/.emacs.d/amx-items")
;;          (amx-history-length . 20))
;;   :init (amx-initialize))

(leaf savehist
  :straight t
  :init (savehist-mode))

;;; marginalia

(leaf marginalia
  :straight t
  :init (marginalia-mode))


;;; embark
(leaf embark
  :straight t)


;;; consult

(leaf consult
  :straight t
  :setq ((completion-in-region-function . (lambda (&rest args)
                                            (apply (if vertico-mode
                                                       #'consult-completion-in-region
                                                     #'completion--in-region)
                                                   args)))
         (consult-buffer-sources . '(consult--source-hidden-buffer
                                     consult--source-buffer)))
  ;:bind (())
  )


(defvar custom-command-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "f" 'find-file)
    (define-key map "b" 'switch-to-buffer)
    (define-key map "B" 'switch-to-buffer-other-window)
    (define-key map "k" 'kill-buffer)
    (define-key map "s" 'imenu)
    (define-key map "m" 'manual-entry)
    (define-key map "y" 'consult-yank-from-kill-ring)
    map))
(defalias 'command custom-command-keymap)

(evil-leader/set-key
  "f" 'command)


(provide 'init-M-x)

;;; init-M-x.el ends here

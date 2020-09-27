;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf evil
  :straight t
  :init (progn (setq evil-want-keybinding nil
                     evil-want-C-i-jump nil))
  :config (progn (evil-mode 1))
  :bind ((:evil-insert-state-map
          ("C-k" . nil) ; conflict with other ^k bindings
          )))


(leaf evil-collection
  :straight t
  :config (progn (evil-collection-init '(ag
                                         calender
                                         cider
                                         comint
                                         company
                                         compile
                                         dired
                                         docker
                                         eshell
                                         flycheck
                                         ivy
                                         lsp-ui-imenu
                                         magit
                                         magit-todos
                                         man
                                         which-key
                                         xref))))


(leaf evil-leader
  :straight t
  :config (progn (global-evil-leader-mode t)
                 (evil-leader/set-leader "<SPC>")))


(leaf evil-multiedit
  :straight t
  :leaf-defer nil
  :bind ((:evil-multiedit-state-map
          ("j" . iedit-next-occurrence)
          ("k" . iedit-prev-occurrence)
          ("C-j" . evil-multiedit-match-and-next)
          ("C-k" . evil-multiedit-match-and-prev))))


(leaf evil-surround
  :straight t
  :config (global-evil-surround-mode))


(leaf evil-commentary
  :straight t
  :config (evil-commentary-mode))


(leaf evil-args
  :straight t
  :hook ((emacs-lisp-mode-hook clojure-mode-hook) . (lambda ()
                                                      (setq evil-args-delimiters " ")))
  :bind ((:evil-inner-text-objects-map
          ("a" . evil-inner-arg))
         (:evil-outer-text-objects-map
          ("a" . evil-outer-arg))
         (:evil-normal-state-map
          ("L" . evil-forward-arg)
          ("H" . evil-backward-arg)
          ("K" . evil-jump-out-args))
         (:evil-normal-state-map
          ("L" . evil-forward-arg)
          ("H" . evil-backward-arg)
          ("K" . evil-jump-out-args))))


(leaf evil-exchange
  :straight t)


(leaf evil-matchit
  :straight t
  :hook (((prog-mode-hook org-mode-hook) . turn-on-evil-matchit-mode)))


(leaf evil-numbers
  :straight t
  :require t
  :bind ((:evil-normal-state-map
          ("+" . evil-numbers/inc-at-pt)
          ("-" . evil-numbers/dec-at-pt))
         (:evil-visual-state-map
          ("+" . evil-numbers/inc-at-pt)
          ("-" . evil-numbers/dec-at-pt))))


(leaf evil-visualstar
  :straight t
  :setq ((evil-visualstar/persistent . t))
  :config (global-evil-visualstar-mode))


;; (leaf evil-quickscope
;;   :straight t
;;   :hook (((prog-mode-hook org-mode-hook text-mode-hook) . evil-quickscope-always-mode)
;;          (dired-mode-hook . (lambda ()
;;                               (evil-quickscope-always-mode 0)))))


(leaf evil-snipe
  :straight t
  :config (evil-snipe-override-mode))


(leaf evil-easymotion
  :straight t
  :require t
  :config (evilem-default-keybindings "\\"))


;;; keymap

(defvar custom-evil-multiedit-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "a" 'evil-multiedit-match-all)
    (define-key map "e" 'evil-multiedit-match-and-next)
    (define-key map "r" 'evil-multiedit-restore)
    (define-key map "s" 'evil-multiedit-ex-match)
    map))
(defalias 'evil-multiedit custom-evil-multiedit-keymap)


(evil-leader/set-key
  "0" 'delete-window
  "1" 'delete-other-windows
  "2" 'split-window-below
  "3" 'split-window-right
  "4" 'ctl-x-4-prefix
  "5" 'ctl-x-5-prefix
  "6" '2C-command
  "8" 'iso-transl-ctl-x-8-map
  "c" 'evil-exchange
  "C" 'evil-exchange-cancel
  "e" 'evil-multiedit
  "h" 'help-command
  "q" 'quit-window
  "v" 'mark-defun
  ":" 'eval-expression
  ";" 'evil-commentary-line
  "[" 'beginning-of-defun
  "]" 'end-of-defun
  "<RET>" 'revert-buffer)


;;; init-evil.el ends here

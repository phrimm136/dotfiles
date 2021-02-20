;;; init-evil.el --- configuration for evil -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(leaf evil
  :straight t
  :init (progn (setq evil-want-keybinding nil
                     evil-want-c-i-jump nil))
  :config (progn (evil-mode 1)
                 (evil-set-undo-system 'undo-tree))
  :bind ((:evil-insert-state-map
          ("C-k" . nil) ; conflict with other ^k bindings
          )))


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
  :require t
  :hook ((emacs-lisp-mode-hook clojure-mode-hook) . (lambda ()
                                                      (setq-local evil-args-delimiters '(" "))))
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
  :bind ((:evil-normal-state-map
          ("gw" . evilem-motion-forward-word-begin)
          ("gW" . evilem-motion-forward-WORD-begin)
          ("ge" . evilem-motion-forward-word-end)
          ("gE" . evilem-motion-forward-WORD-end)
          ("gb" . evilem-motion-backward-word-begin)
          ("gB" . evilem-motion-backward-WORD-begin)
          ("gj" . evilem-motion-next-line)
          ("gk" . evilem-motion-previous-line)
          ("gt" . evilem-motion-find-char-to)
          ("gT" . evilem-motion-find-char-to-backward)
          ("gf" . evilem-motion-find-char)
          ("gF" . evilem-motion-find-char-backward)
          ("g[[" . evilem-motion-backward-section-begin)
          ("g[]" . evilem-motion-backward-section-end)
          ("g]]" . evilem-motion-forward-section-begin)
          ("g][" . evilem-motion-forward-section-end)
          ("g(" . evilem-motion-backward-sentence-begin)
          ("g)" . evilem-motion-forward-sentence-begin)
          ("gn" . evilem-motion-search-next)
          ("gN" . evilem-motion-search-previous)
          ("g*" . evilem-motion-search-word-forward)
          ("g#" . evilem-motion-search-word-backward)
          ("g-" . evilem-motion-previous-line-first-non-blank)
          ("g+" . evilem-motion-next-line-first-non-blank))))


(leaf evil-lion
  :straight t
  :config (evil-lion-mode))


(leaf evil-collection
  :straight t
  :setq ((evil-collection-setup-minibuffer . t))
  :config (progn (evil-collection-init)))


;;; keymap

(evil-ex-define-cmd "stp" 'straight-pull-all)
(evil-ex-define-cmd "stb" 'straight-rebuild-all)
(evil-ex-define-cmd "stc" 'straight-check-all)


(defvar custom-evil-multiedit-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map "a" 'evil-multiedit-match-all)
    (define-key map "e" 'evil-multiedit-match-and-next)
    (define-key map "r" 'evil-multiedit-restore)
    (define-key map "s" 'evil-multiedit-ex-match)
    map))
(defalias 'evil-multiedit custom-evil-multiedit-keymap)


(evil-leader/set-key
  "0" 'evil-window-delete
  "1" 'delete-other-windows
  "2" 'evil-window-split
  "3" 'evil-window-vsplit
  "4" 'ctl-x-4-prefix
  "5" 'ctl-x-5-prefix
  "6" '2C-command
  "8" 'iso-transl-ctl-x-8-map
  "e" 'evil-multiedit
  "h" 'help-command
  "q" 'quit-window
  "v" 'mark-defun
  "gn" 'narrow-to-region
  "gw" 'widen
  ":" 'eval-expression
  ";" 'evil-commentary-line
  "[" 'beginning-of-defun
  "]" 'end-of-defun
  "<RET>" 'revert-buffer)


;;; init-evil.el ends here

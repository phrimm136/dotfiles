;;; init-modeline.el --- configuration for modeline -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; hide modeline

(leaf hide-mode-line
  :straight t
  :hook ((org-agenda-mode-hook) . hide-mode-line-mode))


;;; attributes

(defun custom-evil-region-line-number nil
  "Show region line number on the modeline."
  (if (and (bound-and-true-p evil-mode)
           (eq evil-state 'visual))
      (format " %s lines " (let ((begin (region-beginning))
                                 (end (region-end)))
                             (cond ((>= begin end) (+ 1 (count-lines begin end)))
                                   (t (count-lines begin end)))))))


;;; modeline makeup

;;; https://emacs.stackexchange.com/a/16658

(eval-and-compile
  (defun mode-line-fill-right (face reserve)
    "Return empty space using FACE and leaving RESERVE space on the right."
    (unless reserve
      (setq reserve 20))
    (when (and window-system (eq 'right (get-scroll-bar-mode)))
      (setq reserve (- reserve 2)))
    (propertize " "
                'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve))))))

(eval-and-compile
  (defun mode-line-fill-center (face reserve)
    "Return empty space using FACE to the center of remaining space leaving RESERVE space on the right."
    (unless reserve
      (setq reserve 20))
    (when (and window-system (eq 'right (get-scroll-bar-mode)))
      (setq reserve (- reserve 3)))
    (propertize " "
                'display `((space :align-to (- (+ center (.5 . right-margin)) ,reserve
                                               (.5 . left-margin)))))))

(eval-and-compile
  (defun reserve-left/middle (line)
    (/ (length (format-mode-line line)) 2)))

(eval-and-compile
  (defun reserve-middle/right (line)
    (length (format-mode-line line))))

(defvar mode-line-align-left ;; file status
  '((:properlize " %b ") ;; file name
    (:properlize (:eval (if (bound-and-true-p vc-mode)
                            (concat " Git:" (substring vc-mode 5) " ")
                          ""))) ;; version control system; need to show more information.
    (:properlize " %* ") ;; buffer R/W state - modified / read only / saved
    (:properlize evil-mode-line-tag) ;; evil state
    (:properlize (:eval (if (bound-and-true-p flycheck-mode)
                            flycheck-mode-line
                          ""))) ;; flycheck errors
    (:properlize (:eval (if (and (bound-and-true-p lsp-mode)
                                 (ignore-errors (lsp--find-clients)))
                            (concat " "
                                    (lsp-mode-line))
                          ""))) ;; language server status
    (:properlize (:eval (if (bound-and-true-p workgroups-mode)
                            (concat " "
                                    (wg-mode-line-string))
                          ""))) ;; workgroups statue
    (:properlize (:eval (if (bound-and-true-p iedit-mode)
                            iedit-mode-line
                          ""))) ;; iedit candidates
    (:properlize (:eval (custom-evil-region-line-number)))))

(defvar mode-line-align-middle ;; 3rd parth package states
  '())

(defvar mode-line-align-right ;; editing status
  '((:properlize (:eval (cond ((eq major-mode 'pdf-view-mode) (format " %s P " (pdf-view-current-page))) ;; current page for pdfview mode
                              (t (concat " %l : %c " ;; cursor position - row : column
                                         " %p / %Ib " ;; percentage of the buffer text above the top of the window / file size
                                         (let ((encoding (coding-system-plist buffer-file-coding-system)))
                                           (cond ((memq (plist-get encoding :category)
                                                        '(coding-category-undecided coding-category-utf-8))
                                                  " UTF-8 ")
                                                 (t (upcase (symbol-name (plist-get encoding :name)))))) ;; encoding
                                         (pcase (coding-system-eol-type buffer-file-coding-system)
                                           (0 " LF ")
                                           (1 " CRLF ")
                                           (2 " CR ")) ;; EoL type
                                         )))))
    (:properlize " %m ") ;; major mode
    ))

(defvar custom-mode-line (list mode-line-align-left
                               '(:eval (mode-line-fill-center 'mode-line (reserve-left/middle mode-line-align-middle)))
                               mode-line-align-middle
                               '(:eval (mode-line-fill-right 'mode-line (reserve-middle/right mode-line-align-right)))
                               mode-line-align-right))

(setq-default mode-line-format custom-mode-line)


;;; clean major modes

(defvar mode-line-cleaner-alist
  '(;; major-mode
    (c-mode . "C")
    (c++-mode . "C++")
    (eshell-mode . "[Eshell]")
    (python-mode . "Python")
    (inferior-python-mode . "[Python]")
    (julia-mode . "Julia")
    (julia-repl-mode . "[Julia]")
    (pdf-view-mode . "PDF")
    (emacs-lisp-mode . "ELisp")
    (lisp-interaction-mode . "[Lisp]")
    (cider-repl-mode . "[Clojure]")))

(defun clean-mode-line ()
  (interactive)
  (cl-loop for (mode . mode-str) in mode-line-cleaner-alist
           do
           (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook  'clean-mode-line)


;;; init-modeline.el ends here

;;; package --- summary:
;;; Commentary:
;;; Code:


;;; attribute

;;; https://emacs.stackexchange.com/a/16658

(defun mode-line-fill-right (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))))

(defun mode-line-fill-center (face reserve)
  "Return empty space using FACE to the center of remaining space leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ center (.5 . right-margin)) ,reserve
                                             (.5 . left-margin))))))

(defun reserve-left/middle (line)
  (/ (length (format-mode-line line)) 2))

(defun reserve-middle/right (line)
  (length (format-mode-line line)))

(defvar mode-line-align-left ;; file states
  '((:properlize " %* ") ;; buffer current state - modified / read only / otherwise
    (:properlize (:eval (if (ignore-errors vc-mode)
                            (concat " " (substring vc-mode 5) " ")
                          ""))) ;; version control system
    (:properlize " %b ") ;; file name
    ))

(defvar mode-line-align-middle ;; variables
  '((:properlize evil-mode-line-tag) ;; evil modal
    (:properlize (:eval (if (ignore-errors flycheck-mode)
                            (pcase flycheck-last-status-change
                              (`not-checked "0/0/0")
                              (`no-checker "-/-/-")
                              (`running "*/*/*")
                              (`errored "!/!/!")
                              (`finished (let-alist (flycheck-count-errors flycheck-current-errors)
                                           (if (or .error .warning .info)
                                               (format "%s/%s/%s"
                                                       (or .error 0)
                                                       (or .warning 0)
                                                       (or .info 0))
                                             "")))
                              (`interrupted "././.")
                              (`suspicious "?/?/?"))
                          ""))) ;; flycheck errors - error / warning / info
    (:properlize (:eval (if (ignore-errors iedit-mode)
                            (format " %s/%s "
                                    iedit-occurrence-index
                                    (iedit-counter))
                          ""))) ;; iedit candidates
    ))

(defvar mode-line-align-right ;; miscellaneouses
  '((:properlize " %4l : %3c ") ;; cursor position - row / column
    (:properlize " %6p ") ;; percentage of the buffer text above the top of the window
    (:properlize (:eval (pcase (coding-system-eol-type buffer-file-coding-system)
                          (0 " LF ")
                          (1 " CRLF ")
                          (2 " CR ")))) ;; return case
    (:properlize (:eval ))
    (:properlize " %m ") ;; major mode
    ))

(setq-default mode-line-format
              (list mode-line-align-left
                    '(:eval (mode-line-fill-center 'mode-line (reserve-left/middle mode-line-align-middle)))
                    mode-line-align-middle
                    '(:eval (mode-line-fill-right 'mode-line (reserve-middle/right mode-line-align-right)))
                    mode-line-align-right
                    ))


;;; clean major/minor mode

(defvar mode-line-cleaner-alist
  '(;; major-mode
    (c-mode . "C")
    (c++-mode . "C++")
    (python-mode . "Python")
    (inferior-python-mode . "[Python]")
    (ein:notebook-multilang-mode . "iPython")
    (ein:notebooklist-mode . "iPython-notebooklist")
    (eshell-mode . "[Eshell]")
    (ess-julia-mode . "Julia")
    (inferior-ess-julia-mode . "[Julia]")
    (pdf-view-mode . "PDF")
    (emacs-lisp-mode . "ELisp")
    (lisp-interaction-mode . "[Lisp]")))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'emacs-startup-hook  'clean-mode-line)


;;;

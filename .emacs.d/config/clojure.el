;;; package --- summary:
;;; Commentary:
;;; Code:


(leaf clojure-mode
  :ensure t
  :hook (clojure-mode-hook . cider-jack-in))

(leaf rainbow-delimiters
  :ensure t
  :hook (clojure-mode-hook . rainbow-delimiters-mode))


;;;

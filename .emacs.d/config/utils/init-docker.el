;;; package --- summary:
;;; Commentary:
;;; Code:


;;; docker

(leaf docker
  :ensure t
  :leaf-defer nil
  :config (progn (evil-leader/set-key
                   "d" 'docker))
  :bind ((:image-mode-map
          ("k" . evil-next-line))))


;;; init-docker.el ends here

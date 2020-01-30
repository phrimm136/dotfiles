;;; package --- summary:
;;; Commentary:
;;; Code:


;;; docker

(leaf docker
  :straight t
  :config (progn (evil-leader/set-key
                   "d" 'docker)
                 (dolist (docker-modes '(docker-image-mode docker-container-mode docker-network-mode docker-volume-mode))
                   (evil-set-initial-state docker-modes 'motion))))


;;; init-docker.el ends here

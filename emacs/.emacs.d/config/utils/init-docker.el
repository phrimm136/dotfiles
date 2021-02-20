;;; init-docker.el --- configuration for docker -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; docker

(leaf docker
  :straight t
  :config (progn (evil-leader/set-key
                   "d" 'docker)
                 (dolist (docker-modes '(docker-image-mode docker-container-mode docker-network-mode docker-volume-mode))
                   (evil-set-initial-state docker-modes 'normal))))


;;; init-docker.el ends here

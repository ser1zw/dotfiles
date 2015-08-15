;; -*- mode: emacs-lisp; coding: utf-8 -*-

(add-to-list 'load-path (get-latest-package-dir "helm"))
(add-to-list 'load-path (get-latest-package-dir "helm-core"))
(require 'helm)
(require 'helm-config)
(helm-mode +1)

(global-set-key (kbd "C-x C-h h") 'helm-mini)
(global-set-key (kbd "C-x C-h r") 'helm-recentf)
(global-set-key (kbd "C-x C-h i") 'helm-imenu)
(global-set-key (kbd "C-x C-h k") 'helm-show-kill-ring)

(define-key helm-map (kbd "C-h") 'delete-backward-char)

(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)


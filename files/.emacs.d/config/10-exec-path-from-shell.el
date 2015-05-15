;; -*- mode: emacs-lisp; coding: utf-8 -*-

(add-to-list 'load-path (get-latest-package-dir "exec-path-from-shell"))
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; (let ((envs '("PATH")))
;;   (exec-path-from-shell-copy-envs envs))

;; http://kotatu.org/blog/2012/03/02/emacs-path-settings/
;; (let ((path-str
;;        (replace-regexp-in-string
;; 	"\n+$" "" (shell-command-to-string "echo $PATH"))))
;;   (setenv "PATH" path-str)
;;   (setq exec-path (nconc (split-string path-str ":") exec-path)))


;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete-mode
;; http://cx4a.org/software/auto-complete/index.ja.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-complete-directory (concat user-emacs-directory "/elpa/auto-complete-20130724.1750"))
(add-to-list 'load-path auto-complete-directory)
(add-to-list 'load-path (concat user-emacs-directory "/elpa/popup-20130324.1305"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat auto-complete-directory "/dict"))
(autoload 'auto-complete-config "auto-complete-config" "auto-complete-config" t)
(ac-config-default)


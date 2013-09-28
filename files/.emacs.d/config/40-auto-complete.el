;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete-mode
;; http://cx4a.org/software/auto-complete/index.ja.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-complete-directory (get-latest-package-dir "auto-complete"))
(add-to-list 'load-path auto-complete-directory)
(add-to-list 'load-path (get-latest-package-dir "popup"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat auto-complete-directory "/dict"))
(autoload 'auto-complete-config "auto-complete-config" "auto-complete-config" t)
(ac-config-default)


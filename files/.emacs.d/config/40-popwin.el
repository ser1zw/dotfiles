;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; popwin-el
;; https://github.com/m2ym/popwin-el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (get-latest-package-dir "popwin"))
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config
      (append '(("*Backtrace*") ("*Warnings*") ("*Help*")
		("*Completions*") ("*Buffer List*"))))


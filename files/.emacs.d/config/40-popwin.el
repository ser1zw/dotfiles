;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; popwin-el
;; https://github.com/m2ym/popwin-el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (concat user-emacs-directory "/plugin/popwin-el-0.6.1"))
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config
      (append '(("*Backtrace*") ("*Warnings*") ("*Help*")
		("*Completions*") ("*Buffer List*"))))

                

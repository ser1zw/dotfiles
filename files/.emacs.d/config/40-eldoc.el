;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eldoc
;; (参考 http://d.hatena.ne.jp/rubikitch/20090207/1233936430)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'eldoc)
(setq eldoc-idle-delay 1.0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

;; eldoc-extension
;; http://www.emacswiki.org/cgi-bin/wiki/download/eldoc-extension.el
(add-to-list 'load-path (concat user-emacs-directory "/plugin/eldoc-extension"))
(require 'eldoc-extension)

(add-to-list 'load-path (get-latest-package-dir "c-eldoc"))
(load "c-eldoc")
(add-hook 'c-mode-hook
          (lambda ()
            (set (make-local-variable 'eldoc-idle-delay) 0.20)
            (c-turn-on-eldoc-mode)))


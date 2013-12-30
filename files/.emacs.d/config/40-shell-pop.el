;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shell-pop
;; https://github.com/kyagi/shell-pop-el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (get-latest-package-dir "shell-pop"))
(require 'shell-pop)
(custom-set-variables
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "\C-ct")
 '(shell-pop-window-height 50)
 '(shell-pop-window-position "bottom"))


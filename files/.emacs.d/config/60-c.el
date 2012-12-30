;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

(add-hook 'c-mode-hook
	  (function (lambda ()
		      (setq comment-start "// ")
		      (setq comment-end "")
		      (setq compile-command "gcc -Wall"))))




;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'slime)
;; (setq inferior-lisp-program "clisp")
;; (setq slime-net-coding-system 'utf-8-unix)
;; (add-hook 'lisp-mode-hook
;; 	  (function (lambda ()
;;		      (slime-mode t))))
;; (add-hook 'inferior-lisp-mode-hook
;; 	  (function (lambda () (inferior-slime-mode t))))
;; (slime-autodoc-mode)

;; These are the 3 CL implementations that currently work with SLIME/Win32:
;; (Note: Unless you want to try out all 3, you only need one of these functions)
;; CMU Common Lisp - http://www.common-lisp.net/project/cmucl
;; (defun cmucl-start ()
;;   (interactive)
;;   (shell-command "~/local/bin/lisp -core ~/local/lib/cmucl/lib/user.core -load ~/.slime.lisp&"))

;; SBCL
;; (defun sbcl-start ()
;;   (interactive)
;;   (shell-command "sbcl --core ~/local/lib/sbcl/main.core --load ~/.slime.lisp &"))

;; GNU CLISP - http://clisp.cons.org/
;; (defun clisp-start ()
;;   (interactive)
;;   (shell-command (format "clisp -K full -q -ansi -i %s/.slime.lisp &" (getenv "HOME"))))



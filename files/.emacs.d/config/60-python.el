;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq python-mode-hook
      '(lambda ()
	 (local-set-key [(C <)] 'python-shift-left)
	 (local-set-key [(C >)] 'python-shift-right)))


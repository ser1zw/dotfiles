;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

(add-to-list 'load-path (concat user-emacs-directory "/plugin/actionscript-mode"))

;; via http://blog.pettomato.com/content/site-lisp/.emacs
(defvar running-on-x (eq window-system 'x))
(autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
;; Activate actionscript-mode for any files ending in .as
(add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))
;; Load our actionscript-mode extensions.
;; (eval-after-load "actionscript-mode" '(load "as-config"))
(add-hook 'actionscript-mode-hook
          (function (lambda ()
		      (setq standard-indent 2)
		      (set-default-coding-systems 'utf-8))))




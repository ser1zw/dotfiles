;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

(add-to-list 'load-path (get-latest-package-dir "ruby-electric"))
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(defun ruby-insert-end () 
  "Insert \"end\" at point and reindent current line." 
  (interactive) 
  (insert "end") 
  (ruby-indent-line t) 
  (end-of-line))


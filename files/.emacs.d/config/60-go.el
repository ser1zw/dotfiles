;; -*- mode: emacs-lisp; coding: utf-8 -*-

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
(add-hook 'go-mode-hook '(lambda () (setq tab-width 4)))


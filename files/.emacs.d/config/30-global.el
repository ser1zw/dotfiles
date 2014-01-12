;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU global
;; http://www.bookshelf.jp/soft/meadow_42.html#SEC638
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (concat user-emacs-directory "/plugin/gtags"))
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
	 (setq gtags-select-buffer-single t)
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-c\C-t" 'gtags-pop-stack)))

(defvar *gtags-mode-hook-list* ; gtags-modeを設定するモードのhook
  '(c-mode-hook
    c++-mode-hook))
(dolist (hook *gtags-mode-hook-list*)
  (add-hook hook
	    (function (lambda () (gtags-mode t)))))



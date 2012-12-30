;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;; Ctrl-h を前1文字削除に変更
(define-key global-map "\C-h" 'backward-delete-char)

;; リージョンのコメントアウト/解除
(global-set-key "\C-c\C-z" 'uncomment-region)
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

;; yes/noをy/nでもよくする
(defalias 'yes-or-no-p 'y-or-n-p)

;; C-zでzap-to-char (M-zのやつ)
(global-unset-key "\C-z")
(global-set-key "\C-z" 'zap-to-char)



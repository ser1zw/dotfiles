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
(global-set-key [?\C-:] 'zap-to-char)

;; バッファの移動
;; http://d.hatena.ne.jp/authorNari/20091225/1261667956
(setq windmove-wrap-around t)
(windmove-default-keybindings)
(define-key global-map [(C M n)] 'windmove-down)
(define-key global-map [(C M p)] 'windmove-up)
(define-key global-map [(C M b)] 'windmove-left)
(define-key global-map [(C M f)] 'windmove-right)

;; Macの場合はCommandキーをMetaキーとして使用
(if (equal system-type 'darwin)
    (progn
      (setq ns-command-modifier (quote meta))
      (setq ns-alternate-modifier (quote super))))




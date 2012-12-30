;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ibus.el
;; http://www11.atwiki.jp/s-irie/pages/21.html
;; (参考 http://d.hatena.ne.jp/supermassiveblackhole/20100609)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ibus/")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)

(global-set-key "\C-o" 'ibus-toggle)
(global-set-key "\C-\\" 'ibus-toggle)
(ibus-define-common-key ?\C-\s nil) ; C-SPC は Set Mark に使う
(setq ibus-cursor-color '("green" "yellow" "red")) ; IBusの状態によってカーソル色を変化させる



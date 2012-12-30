;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

(setq user-emacs-directory (expand-file-name "~/.emacs.d"))

;; init-loader.el
;; https://gist.github.com/1021706
(add-to-list 'load-path (concat user-emacs-directory "/plugin/init-loader"))
(require 'init-loader)
(setq init-loader-show-log-after-init nil) ; 起動時のログバッファを表示しない (M-x init-loader-show-log で表示可能)
(init-loader-load (concat user-emacs-directory "/config"))

(if (> (length (init-loader-error-log)) 0) ; エラーがあったときだけログバッファを表示する
    (init-loader-show-log))

;; Byte-compile all config files
;; $ emacs -batch -f batch-byte-compile ~/.emacs.d/config/*.el

(put 'eval-expression 'disabled nil)


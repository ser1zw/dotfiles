;; -*- mode: emacs-lisp; coding: utf-8-unix -*-
(require 'cl)

(setq user-emacs-directory (expand-file-name "~/.emacs.d"))
(setq load-prefer-newer t)

(defun get-latest-package-dir (pkg-name &optional dir)
  (setq dir (or dir (concat user-emacs-directory "/elpa")))
  (setq pkg-dir (find-if '(lambda (d) (string-match (concat "^" pkg-name) d))
			 (directory-files dir)))
  (concat dir "/" pkg-dir))

;; init-loader.el
;; https://gist.github.com/1021706
(add-to-list 'load-path (get-latest-package-dir "init-loader"))
(require 'init-loader)
(setq init-loader-show-log-after-init nil) ; 起動時のログバッファを表示しない (M-x init-loader-show-log で表示可能)
(init-loader-load (concat user-emacs-directory "/config"))

(if (not (equal (init-loader-error-log) "")) ; エラーがあったときだけログバッファを表示する
    (init-loader-show-log))

;; Byte-compile all config files
;; $ emacs -batch -f batch-byte-compile ~/.emacs.d/config/*.el

(put 'eval-expression 'disabled nil)


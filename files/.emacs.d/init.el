;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "Japanese")
 '(default-input-method "japanese-mozc")
 '(display-time-mode t nil (time))
 '(global-font-lock-mode t nil (font-lock))
 '(package-selected-packages
   (quote
    (cider clojure-mode migemo yasnippet tabbar init-loader helm exec-path-from-shell)))
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "t")
 '(shell-pop-window-position "bottom")
 '(shell-pop-window-size 50)
 '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "VL ゴシック")))))

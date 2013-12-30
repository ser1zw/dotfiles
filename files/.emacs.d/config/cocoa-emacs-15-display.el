;; -*- mode: emacs-lisp; coding: utf-8-unix -*-
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white"
			 :inverse-video nil :box nil :strike-through nil :overline nil
			 :underline nil :slant normal :weight normal :height 150 :width normal
			 :foundry "unknown" :family "VL ゴシック")))))

(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Kaku Gothic ProN"))

(add-hook 'after-init-hook '(lambda ()
			      (mapc
			       (lambda (buf) (set-buffer buf) (cd (expand-file-name "~"))) (buffer-list))))


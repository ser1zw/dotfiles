;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 色の変更
;; (参考 http://homepage.mac.com/zenitani/elisp-j.html#color)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if window-system
    (progn
      ;; 文字の色を設定します。
      (add-to-list 'default-frame-alist '(foreground-color . "white"))
      ;; 背景色を設定します。
      (add-to-list 'default-frame-alist '(background-color . "black"))
      ;; カーソルの色を設定します。
      (add-to-list 'default-frame-alist '(cursor-color . "yellow"))
      ;; マウスポインタの色を設定します。
      ;; (add-to-list 'default-frame-alist '(mouse-color . "SlateBlue2"))
      ;; モードラインの文字の色を設定します。
      (set-face-foreground 'modeline "black")
      ;; モードラインの背景色を設定します。
      (set-face-background 'modeline "MediumPurple2")
      ;; 選択中のリージョンの色を設定します。
      (set-face-background 'region "blue")
      ;; モードライン（アクティブでないバッファ）の文字色を設定します。
      ;; (set-face-foreground 'mode-line-inactive "gray30")
      ;; モードライン（アクティブでないバッファ）の背景色を設定します。
      ;; (set-face-background 'mode-line-inactive "gray85")
      ))

;;; mark 領域に色付け
(setq transient-mark-mode t)

;;; visible-bell
(setq visible-bell t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "Japanese")
 '(default-input-method "japanese-ibus")
 '(display-time-mode t nil (time))
 '(global-font-lock-mode t nil (font-lock))
 '(tool-bar-mode nil nil (tool-bar)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white"
			 :inverse-video nil :box nil :strike-through nil :overline nil
			 :underline nil :slant normal :weight normal :height 130 :width normal
			 :foundry "unknown" :family "VL ゴシック")))))


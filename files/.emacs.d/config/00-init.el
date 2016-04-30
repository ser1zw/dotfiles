;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;;; gzファイルも編集できるように
(auto-compression-mode t)

;;; 行番号を表示する
(line-number-mode t)

;;; ファイル名補完で大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; ステータスラインに時間を表示する
(if (or (and (>= emacs-major-version 20)
             (not (equal (getenv "LANG") "ja_JP.UTF-8")))
        (>= emacs-major-version 22))
    (progn
      (setq dayname-j-alist
	    '(("Sun" . "日") ("Mon" . "月") ("Tue" . "火") ("Wed" . "水")
	      ("Thu" . "木") ("Fri" . "金") ("Sat" . "土")))
      (setq display-time-string-forms
	    '((format "%s年%s月%s日(%s) %s:%s %s"
		      year month day
		      (cdr (assoc dayname dayname-j-alist))
		      24-hours minutes
		      load)))
      ))
(display-time)

;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; upcase-region と downcase-region を使えるようにする
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; EmacsのキルリングとGnomeのクリップボードを同期
(if window-system
    (setq x-select-enable-clipboard t))

;; coding systemをutf-8に
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(add-hook 'find-file-hooks
	  (function (lambda ()
		      (set-default-coding-systems 'utf-8-unix))))

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; 起動時のスプラッシュを表示しない
(setq inhibit-startup-message t)

;; バッファ内をインデント
(global-set-key "\M-i"
		(function (lambda()
			    (interactive)
			    (indent-region (point-min) (point-max))
			    (message "indent buffer"))))

;; ファイルの先頭に#!が含まれてたら自動的に chmod +x
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;; 起動時のウィンドウサイズ設定
;; (if window-system
;;     (setq initial-frame-alist '((width . 120) (height . 25))))

;; Emacsをサーバ化(emacsclientが使えるようになる)
(require 'server)
(unless (server-running-p)
  (server-start))

;; 対応するカッコのハイライト表示
(show-paren-mode t)

;; cua-modeで矩形選択
;; http://kreisel.fam.cx/webmaster/clog/2010-09-20-1.html
(cua-mode t)
(setq cua-enable-cua-keys nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; (setq max-specpdl-size 10000)
;; (setq max-lisp-eval-depth 10000)

(add-to-list 'exec-path "/usr/local/bin")


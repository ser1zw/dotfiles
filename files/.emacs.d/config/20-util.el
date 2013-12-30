;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 所有者がrootのファイルをsudoで開き直す
;; (参考 http://ubulog.blogspot.com/2010/03/emacs-sudo.html)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun file-root-p (filename)
  "Return t if file FILENAME created by root."
  (eq 0 (nth 2 (file-attributes filename))))

(defun th-rename-tramp-buffer ()
  (when (file-remote-p (buffer-file-name))
    (rename-buffer
     (format "%s:%s"
             (file-remote-p (buffer-file-name) 'method)
             (buffer-name)))))

(add-hook 'find-file-hook
          'th-rename-tramp-buffer)

(defadvice find-file (around th-find-file activate)
  "Open FILENAME using tramp's sudo method if it's read-only."
  (if (and (file-root-p (ad-get-arg 0))
           (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File "
                             (ad-get-arg 0)
                             " is read-only.  Open it as root? ")))
      (th-find-file-sudo (ad-get-arg 0))
    ad-do-it))

(defun th-find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))


;; 指定された方向へウィンドウを拡大or縮小
(defun enlarge-or-shrink-window (direction)
  (let ((extend-width 5) (extend-height 3)
	(up "up") (down "down") (left "left") (right "right")
	(is-far-up (equal (car (cdr (window-edges))) 0))
	(is-far-left (equal (car (window-edges)) 0)))
    ;; FIXME 各方向とも3つ以上に分割することはないと仮定
    ;; (条件分岐が増えて面倒なので)
    (cond ((equal direction up) (if is-far-up
				    (shrink-window extend-height)
				  (enlarge-window extend-height)))
	  ((equal direction down) (if is-far-up
				      (enlarge-window extend-height)
				    (shrink-window extend-height)))
	  ((equal direction left) (if is-far-left
				      (shrink-window-horizontally extend-width)
				    (enlarge-window-horizontally extend-width)))
	  ((equal direction right) (if is-far-left
				       (enlarge-window-horizontally extend-width)
				     (shrink-window-horizontally extend-width))))))


(global-set-key [C-left] (function (lambda ()
				     (interactive)
				     (enlarge-or-shrink-window "left"))))

(global-set-key [C-right] (function (lambda ()
				      (interactive)
				      (enlarge-or-shrink-window "right"))))
(global-set-key [C-down] (function (lambda ()
				     (interactive)
				     (enlarge-or-shrink-window "down"))))
(global-set-key [C-up] (function (lambda ()
				   (interactive)
				   (enlarge-or-shrink-window "up"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Unicode escape / unescape
;; http://lisperblog.blogspot.com/2010/09/emacsunicode.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun unicode-unescape-region (start end)
  "指定した範囲のUnicodeエスケープ文字(\\uXXXX)をデコードする."
  (interactive "*r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (re-search-forward "\\\\u\\([[:xdigit:]]\\{4\\}\\)" nil t)
      (replace-match (string (unicode-char
                              (string-to-number (match-string 1) 16)))
                     nil t))))

(defun unicode-escape-region (&optional start end)
  "指定した範囲の文字をUnicodeエスケープする."
  (interactive "*r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (re-search-forward "." nil t)
      (replace-match (format "\\u%04x"
                             (char-unicode
                              (char (match-string 0) 0)))
                     nil t))))

;; iswitchb-mode
(iswitchb-mode 1)
(add-hook 'iswitchb-define-mode-map-hook
	  (function (lambda ()
		      (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
		      (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)
		      (define-key iswitchb-mode-map " " 'iswitchb-next-match))))

;; ウィンドウの端での折り返し有の無を切り替え
(defun toggle-truncate-lines ()
  "toggle truncate-lines"
  (interactive)
  (setq truncate-lines (not truncate-lines))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)

;; hippie-expandでいろいろ補完
(global-set-key "\t" 'hippie-expand)
(global-set-key [(C .)] 'hippie-expand)
(global-set-key "\C-\\" 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	;; try-expand-list
	;; try-expand-line
	yas/hippie-try-expand
	(lambda (arg)
	  (indent-for-tab-command)
	  t)))


;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;; TabBarMode
;; http://www.emacswiki.org/emacs/TabBarMode
;; https://github.com/dholm/tabbar

(add-to-list 'load-path (get-latest-package-dir "tabbar"))
(require 'tabbar)
(tabbar-mode 1)
(tabbar-mwheel-mode -1)
(setq tabbar-buffer-groups-function nil)
(setq tabbar-separator '(1.0))

(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray90"
 :height 0.8
 :box nil)

(set-face-attribute
 'tabbar-unselected nil
 :foreground "grey60"
 :box nil)

(set-face-attribute
 'tabbar-selected nil
 :background "gray40"
 :foreground "gray90"
 :box nil)

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
		     ((equal "*scratch*" (buffer-name b)) b)
		     ((char-equal ?* (aref (buffer-name b) 0)) nil)
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

(global-set-key [(C-tab)] 'tabbar-forward-tab)
(global-set-key [(C-S-iso-lefttab)] 'tabbar-backward-tab)


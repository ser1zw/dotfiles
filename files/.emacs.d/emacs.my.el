;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evernote-mode
;; http://code.google.com/p/emacs-evernote-mode/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; optional
;; (add-to-list 'load-path "~/.emacs.d/evernote-mode")
;; (require 'evernote-mode)
;; (global-set-key "\C-cec" 'evernote-create-note)
;; (global-set-key "\C-ceo" 'evernote-open-note)
;; (global-set-key "\C-ces" 'evernote-search-notes)
;; (global-set-key "\C-ceS" 'evernote-do-saved-search)
;; (global-set-key "\C-cew" 'evernote-write-note)
;; (global-set-key "\C-cep" 'evernote-post-region)
;; (global-set-key "\C-ceb" 'evernote-browser)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EmacsでAnthyを使う
;; (参考 http://anthy.sourceforge.jp/cgi-bin/hiki/hiki.cgi?Emacs%A4%AB%A4%E9)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 日本語をデフォルトにする。
;; (set-language-environment "Japanese")
;; anthy.el をロードできるようにする (必要に応じて)。
;;(push "/usr/lib/emacsen-common/packages/install/anthy" load-path)
;; anthy.el をロードする。
;; (load-library "anthy")
;; japanese-anthy をデフォルトの input-method にする。
;; (setq default-input-method "japanese-anthy")
;; C-oなどでトグル
;; (define-key global-map "\C-\\" 'toggle-input-method)
;; (define-key global-map "\C-o" 'toggle-input-method)
;; (global-set-key [zenkaku-hankaku] 'toggle-input-method)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; js2-mode
;; http://code.google.com/p/js2-mode/
;; (参考 http://8-p.info/emacs-javascript.html)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'load-path "~/.emacs.d/js2-mode/")
;; (when (load "js2" t)
;;   (setq ;; js2-cleanup-whitespace nil
;;    js2-mirror-mode nil
;;    js2-bounce-indent-flag nil)

;;   (defun indent-and-back-to-indentation ()
;;     (interactive)
;;     (indent-for-tab-command)
;;     (let ((point-of-indentation
;;            (save-excursion
;;              (back-to-indentation)
;;              (point))))
;;       (skip-chars-forward "\s " point-of-indentation)))
;;   (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)
;;   (define-key js2-mode-map "\C-m" nil)
;;   (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))




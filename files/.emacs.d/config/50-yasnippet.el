;; -*- mode: emacs-lisp; coding: utf-8 -*-

;; yasnippet
(setq yasnippet-directory (get-latest-package-dir "yasnippet"))
(add-to-list 'load-path yasnippet-directory)
(add-to-list 'load-path (get-latest-package-dir "dropdown-list"))
(require 'yasnippet)
(require 'dropdown-list)
(autoload 'dropdown-list "dropdown-list" "dropdown-list" t)
(setq yas/prompt-functions '(;yas/x-prompt
			     yas/dropdown-prompt
			     yas/ido-prompt
			     yas/completing-prompt
			     yas/no-prompt))

(setq yas/snippet-dirs
      (list
       (concat user-emacs-directory "/snippets")
       (concat yasnippet-directory "/snippets")))

(global-set-key [(C \;)] 'yas-expand)
(yas-global-mode 1)


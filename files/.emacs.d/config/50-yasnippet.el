;; -*- mode: emacs-lisp; coding: undecided-unix -*-

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

(setf user-snippet-dir (concat user-emacs-directory "/snippets")) 
(setf default-snippet-dir (concat yasnippet-directory "/snippets"))
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	"~/.emacs.d/elpa/yasnippet-0.8.0/snippets"
	))
(global-set-key [(C \;)] 'yas/expand)
(yas-global-mode 1)


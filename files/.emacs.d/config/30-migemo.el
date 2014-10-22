;; -*- mode: emacs-lisp; coding: utf-8-unix -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/Migemo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq migemo-directory (concat user-emacs-directory "/plugin/migemo"))
(setq migemo-command "/usr/bin/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary (concat migemo-directory "/" "utf-8/migemo-dict"))
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(add-to-list 'load-path migemo-directory)
(load-library "migemo")
(migemo-init)



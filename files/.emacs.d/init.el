(tool-bar-mode 0)
(global-tab-line-mode)
(global-display-line-numbers-mode)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; $ sudo apt-get install emacs-mozc
(use-package mozc
  :ensure t
  :init
  (setq mozc-helper-program-name "mozc_emacs_helper")
  (setq default-input-method "japanese-mozc")
  (setq mozc-candidate-style 'echo-area))

;; (dolist (x (font-family-list)) (princ x))
(set-face-attribute 'default nil :family "Noto Mono" :height 160)
(set-foreground-color "#ffffff")
(set-face-background 'default "#303030")

(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'left)

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(define-key global-map "\C-h" 'backward-delete-char)

(global-set-key "\C-z" 'undo)
(global-set-key "\C-o" 'toggle-input-method)
(global-set-key [zenkaku-hankaku] 'toggle-input-method)

;; リージョンのコメントアウト/解除
(global-set-key "\C-c\C-z" 'uncomment-region)
(global-set-key "\C-c\C-c" 'comment-or-uncomment-region)

;; Shift+矢印キー でウィンドウ移動
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; yes/noをy/nでもよくする
(defalias 'yes-or-no-p 'y-or-n-p)

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program (expand-file-name "~/.roswell/impls/x86-64/linux/sbcl-bin/2.5.6/bin/sbcl"))
  :config
  (slime-setup '(slime-fancy)))
(define-key slime-repl-mode-map "\C-l"
            'slime-repl-clear-buffer)

(use-package neotree
  :ensure t
  :init
  (setq-default neo-keymap-style 'concise)
  :config
  (setq neo-smart-open t)
  (setq neo-create-file-auto-open t))
(global-set-key [f8] 'neotree-toggle)

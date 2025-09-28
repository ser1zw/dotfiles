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

(use-package vertico
  :ensure t
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 20) ;; Show more candidates
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :ensure t
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

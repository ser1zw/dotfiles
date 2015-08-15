;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; linum-modeで行番号を表示
;; (http://stud4.tuwien.ac.at/~e0225855/linum/linum.html)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if window-system
    (progn
      (setq linum-format "%4d ") ; 4桁分のスペース確保
      (global-linum-mode t)))



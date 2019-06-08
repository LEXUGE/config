;;; init.el --- Init config for Emacs

;;; Commentary:
;; Harry Ying's Emacs config

;;; code:
;; load mods
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/"))

;; package initialize
(require 'init-packages)

;; package settings
(require 'init-settings)

;; keybindings
(require 'init-keybindings)

;; enhance the default settings
(require 'init-better-default)

;; ui settings
(require 'init-ui)

;; custom
(require 'init-custom)

;;; init.el ends here

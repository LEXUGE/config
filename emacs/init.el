;; Harry Ying's Emacs config

;; load mods
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; package initialize
(require 'init-packages)

;; keybindings
(require 'init-keybindings)

;; enhance the default settings
(require 'init-better-default)

;; package settings
(require 'init-settings)

;; ui settings
(require 'init-ui)

;; custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (flycheck lsp-ui rust-mode monokai-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

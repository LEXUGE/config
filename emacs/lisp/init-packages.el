;;; init-packages.el --- Package-related settings
;;; Commentary:
;; Do settings on packages and install them if not
;; Harry Ying's Emacs config

;;; code:
;; always ensure
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; evil mode
(use-package evil)

;; enable company in prog-mode
(use-package company
  :config (setq company-idle-delay 0)
  :config (setq company-show-numbers t)
  :hook (prog-mode . company-mode))

;;; lsp-related:
;; lsp
(use-package lsp-mode
  :hook (prog-mode . lsp)
  :commands lsp)
;; lsp-ui
(use-package lsp-ui
  :commands lsp-ui-mode)
;; company-lsp
(use-package company-lsp
  :commands company-lsp)

;;; rust-related:
;; rust-mode
(use-package rust-mode)
;; toml-mode
(use-package toml-mode)

;;; flycheck-related:
;; flycheck
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config (setq flycheck-emacs-lisp-load-path 'inherit))
;; flycheck-rust
(use-package flycheck-rust
  :after (:all flycheck)
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; yasnippet
(use-package yasnippet
  :config (yas-global-mode 1))

;; neotree
(use-package neotree)

;; All the icon
(use-package all-the-icons)

;; Doom Mode line
(use-package doom-modeline
      :hook (after-init . doom-modeline-mode))

;; monokai-theme
(use-package monokai-theme)

;; auto-update
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (setq auto-package-update-interval 3)
  (auto-package-update-maybe))

;; htmlize for nikola
(use-package htmlize)

;; pdf-tools
(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode)
  :config (pdf-tools-install))

(provide 'init-packages)

;;; init-packages.el ends here

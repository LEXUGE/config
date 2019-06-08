;;; init-settings.el --- Package-related settings
;;; Commentary:
;; Do settings on packages and install them if not
;; Harry Ying's Emacs config

;;; code:
;; always ensure
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; enable company in prog-mode
(use-package company
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
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; yasnippet
(use-package yasnippet
  :config (yas-global-mode 1))

;; neotree
(use-package neotree)

;; monokai-theme
(use-package monokai-theme)

;; auto-update
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(provide 'init-settings)

;;; init-settings.el ends here

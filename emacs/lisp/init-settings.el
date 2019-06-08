;;; init-settings.el --- Package-related settings
;;; Commentary:
;; Harry Ying's Emacs config

;;; code:
;; enable company globally
(global-company-mode 1)

;; company-lsp
(require 'company-lsp)
(push 'company-lsp company-backends)

;; lsp
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)

;; lsp-ui
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; flycheck
;;; init-settings.el --- Package-related settings
(add-hook 'prog-mode-hook 'flycheck-mode)

;; yasnippet
(yas-global-mode 1)

(provide 'init-settings)

;;; init-settings.el ends here

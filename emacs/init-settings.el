;; Harry Ying's Emacs config
;; Package-related settings

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
(add-hook 'prog-mode-hook 'flycheck-mode)

;; yasnippet
(yas-global-mode 1)

(provide 'init-settings)


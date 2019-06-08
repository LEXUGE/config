;;; init-keybindings.el --- Key Bindings

;;; commentary:
;; Harry Ying's Emacs config

;;; code:
;; spelling check
(global-set-key (kbd "<f2>") 'ispell)
(global-set-key (kbd "<f3>") 'flyspell-mode)

;; neotree
(global-set-key (kbd "<f8>") 'neotree-toggle)

(provide 'init-keybindings)

;;; init-keybindings.el ends here

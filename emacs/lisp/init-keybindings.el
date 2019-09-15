;;; init-keybindings.el --- Key Bindings

;;; commentary:
;; Harry Ying's Emacs config

;;; code:
;; spelling check
(global-set-key (kbd "<f2>") 'ispell)
(global-set-key (kbd "<f3>") 'flyspell-mode)

;; neotree
(global-set-key (kbd "<f8>") 'neotree-toggle)

;; toggle linewrap
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

;; toggle evil-mode
(global-set-key (kbd "<f6>") 'evil-mode)

;; resizing window
(global-set-key (kbd "M-H") 'shrink-window-horizontally)
(global-set-key (kbd "M-L") 'enlarge-window-horizontally)
(global-set-key (kbd "M-J") 'shrink-window)
(global-set-key (kbd "M-K") 'enlarge-window)

(provide 'init-keybindings)

;;; init-keybindings.el ends here

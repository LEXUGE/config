;;; init-better-default.el --- Package's settings

;;; Commentary:
;; Harry Ying's Emacs config

;;; Code:
;; highlights current line
(global-hl-line-mode 1)

;; auto reload files
(global-auto-revert-mode t)

;; enhance the backup and auto-save features
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )
(auto-save-visited-mode 1)

(provide 'init-better-default)

;;; init-better-default.el ends here

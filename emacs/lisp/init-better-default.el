;;; init-better-default.el --- Package's settings

;;; Commentary:
;; Harry Ying's Emacs config

;;; Code:
;; highlights current line
(global-hl-line-mode 1)

;; turn off the auto-backup and enhance the auto-save feature
(setq make-backup-files nil)
(setq auto-save-visited-mode t)

(provide 'init-better-default)

;;; init-better-default.el ends here

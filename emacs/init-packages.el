;; Harry Ying's Emacs config
;; Initialize the package-related tasks

;;; code:
;; enable GNU ELPA and MELPA from TUNA
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      company-lsp
		      ;; --- Themes ---
		      monokai-theme
		      ;; Language Server Protocol
		      lsp-mode
		      lsp-ui
		      ;; yasnippet
		      yasnippet
		      ;; File Tree
		      neotree
		      ;; flycheck
		      flycheck
		      ;; rust-mode
		      rust-mode
		      ) "Default packages")

(setq package-selected-packages my/packages)

;; check the status of installation of 'my/packages'
(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

;; install them
(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))

(provide 'init-packages)

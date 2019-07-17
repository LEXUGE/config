;;; init-packages-meta.el --- Initialize the package-related tasks
;;; Commentary:
;; Harry Ying's Emacs config

;;; code:
;; enable GNU ELPA and MELPA from TUNA
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-packages-meta)

;;; init-packages-meta.el ends here

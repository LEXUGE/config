
;; custom-post.el --- Load my personal configs upon centaur emacs	-*- lexical-binding: t -*-

;; Copyright (C) 2020 Vincent Zhang

;; Author: Harry Ying <lexugeyky@outlook.com>
;; URL:https://github.com/LEXUGE/config

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;; Personal customization.
;;

;;; Code:

;; install packages
(use-package vterm)

;; reset homepage
(defconst centaur-homepage
  "https://github.com/LEXUGE/config")

;; set dashboard
(setq dashboard-banner-logo-title "An extensible, customizable, free/libre text editor — and more.")
(setq dashboard-footer "Customized by Harry Ying, powered by Centaur Emacs.")
(setq dashboard-footer-icon (all-the-icons-fileicon "emacs"
                                                    :height 1.1
                                                    :v-adjust -0.05))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; custom-post.el ends here

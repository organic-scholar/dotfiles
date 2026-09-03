;;; init-themes.el --- Personal doom-themes configuration -*- lexical-binding: t; -*-

(require 'use-package)

(use-package doom-themes
  :demand t
  :config
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-org-config))

;; (use-package base16-theme
;;   :ensure t
;;   :config
;;   (load-theme 'base16-ayu-mirage t))


(provide 'init-themes)

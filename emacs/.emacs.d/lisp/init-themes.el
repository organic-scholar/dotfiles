;;; init-themes.el --- Personal doom-themes configuration -*- lexical-binding: t; -*-

(require 'use-package)

(use-package doom-themes
  :demand t
  :config
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-org-config)
  ;; Let the header line blend into the editing area instead of using the
  ;; theme's contrasting header-line background.
  (set-face-attribute 'header-line nil
                      :background (face-background 'default)
                      :foreground (face-foreground 'default)
                      :box nil))

;; (use-package base16-theme
;;   :ensure t
;;   :config
;;   (load-theme 'base16-ayu-mirage t))


(provide 'init-themes)

;;; init-themes.el --- Personal Ef Themes configuration -*- lexical-binding: t; -*-

(require 'use-package)

;; (use-package ef-themes
;;   :demand t
;;   :ensure t
;;   :config
;;   ;; Prevent faces from a previously enabled theme from being layered on top
;;   ;; when this file is evaluated again.
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (load-theme 'ef-dream t)
;;   ;; Let the header line blend into the editing area instead of using the
;;   ;; theme's contrasting header-line background.
;;   (set-face-attribute 'header-line nil
;;                       :background (face-background 'default)
;;                       :foreground (face-foreground 'default)
;;                       :box nil)
;;   (ef-themes-with-colors
;;     (set-face-attribute 'mode-line-active nil
;;                         :background bg-main
;;                         :foreground fg-main)))

;; Previous Doom theme setup, kept here for easy restoration.
(use-package doom-themes
  :demand t
  :ensure t
  :config
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-org-config)
  (set-face-attribute 'header-line nil
                      :background (face-background 'default)
                      :foreground (face-foreground 'default)
                      :box nil)
  (set-face-attribute 'window-divider nil
                      :background (doom-color 'base4)
                      :foreground (doom-color 'base4)))

;; (use-package base16-theme
;;   :ensure t
;;   :config
;;   (load-theme 'base16-ayu-mirage t))

(provide 'init-themes)

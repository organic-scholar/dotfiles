;;; init-themes.el --- Personal Ef Themes configuration -*- lexical-binding: t; -*-

(require 'use-package)

(defun init/set-face-foreground-if-present (face color)
  "Set FACE foreground to COLOR when FACE is defined."
  (when (facep face)
    (set-face-attribute face nil :foreground color)))

(use-package doom-themes
  :demand t
  :ensure t
  :config
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-org-config)
   (set-face-attribute 'font-lock-constant-face nil
                          :foreground "#f0c674")
      (set-face-attribute 'font-lock-type-face nil
                     :foreground "#81a2be")
  (set-face-attribute 'header-line nil
                      :background (face-background 'default)
                      :foreground (face-foreground 'default)
                      :box nil)
  (set-face-attribute 'window-divider nil
                      :background (doom-color 'base4)
                      :foreground (doom-color 'base4)))

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

;; Previous Base16 theme setup, kept here for easy restoration.
;; (use-package base16-theme
;;   :demand t
;;   :ensure t
;;   :config
;;   ;; Prevent faces from a previously enabled theme from being layered on top
;;   ;; when this file is evaluated again.
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (load-theme 'base16-tomorrow-night t)
;;   (set-face-attribute 'header-line nil
;;                       :background (face-background 'default)
;;                       :foreground (face-foreground 'default)
;;                       :box nil))

;; (use-package catppuccin-theme
;;   :ensure t
;;   :custom
;;   (catppuccin-flavor 'mocha)
;;   :config
;;   ;; Prevent faces from a previously enabled theme from being layered on top
;;   ;; when this file is evaluated again.
;;   (mapc #'disable-theme custom-enabled-themes)
;;   (load-theme 'catppuccin t)
;;   (set-face-attribute 'header-line nil
;;                       :background (face-background 'default)
;;                       :foreground (face-foreground 'default)
;;                       :box nil))

;; Tokyo Night is the active theme; Catppuccin remains installed for later use.
;; (use-package tokyo-night
;;   :demand t
;;   :vc (:url "https://github.com/bbatsov/tokyo-night-emacs" :rev :newest))

;; (mapc #'disable-theme custom-enabled-themes)
;; (load-theme 'tokyo-night t)
;; (set-face-attribute 'header-line nil
;;                     :background (face-background 'default)
;;                     :foreground (face-foreground 'default)
;;                     :box nil)

(provide 'init-themes)

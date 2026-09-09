;;; init.el --- Personal Emacs configuration -*- lexical-binding: t; -*-

(print "Hello, World!")

(setq load-prefer-newer t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-package)
(require 'init-no-littering)
(require 'init-ui)
(require 'init-themes)
(require 'init-header-line)
(require 'init-buffers)
(require 'init-windows)
(require 'init-avy)
(require 'init-crux)
(require 'init-editing)
(require 'init-cua)
(require 'init-keymap)
(require 'init-search)
(require 'init-completion)
(require 'init-corfu)
(require 'init-git)
(require 'init-rust)
(require 'init-yaml)
(require 'init-helm)
(require 'init-markdown)
(require 'init-format)
(require 'init-projects)
(require 'init-treemacs)
(require 'init-files)
(require 'init-super-save)
(require 'init-shell)
(require 'init-vterm)
(require 'init-spell)
(require 'init-tabs)
(require 'init-desktop)
(require 'init-copilot)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7771c8496c10162220af0ca7b7e61459cb42d18c35ce272a63461c0fc1336015"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-background-face ((t (:foreground "gray45")))))

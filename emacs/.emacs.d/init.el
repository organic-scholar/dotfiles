(print "Hello, World!")

(which-key-mode 1)   ;; Enable which-key mode

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-package)
(require 'init-ui)
(require 'init-buffers)
(require 'init-windows)
(require 'init-avy)
(require 'init-crux)
(require 'init-editing)
(require 'init-cua)
(require 'init-keymap)
(require 'init-search)
(require 'init-completion)
(require 'init-git)
(require 'init-rust)
(require 'init-projects)
(require 'init-files)
(require 'init-shell)
(require 'init-spell)
(require 'init-tabs)
(require 'init-themes)
(require 'init-desktop)
(require 'init-copilot)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-window base16-theme copilot doom-themes embark-consult
		marginalia orderless projectile vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-background-face ((t (:foreground "gray45")))))

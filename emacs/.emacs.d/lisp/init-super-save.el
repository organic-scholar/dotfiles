;;; init-super-save.el --- Event-driven file saving -*- lexical-binding: t; -*-

(require 'use-package)

(use-package super-save
  :ensure t
  :demand t
  :custom
  ;; Save on buffer/window changes and when Emacs loses focus, without noisy
  ;; echo-area messages or automatic writes to remote files.
  (super-save-silent t)
  (super-save-remote-files nil)
  :config
  (super-save-mode 1))

(provide 'init-super-save)
;;; init-super-save.el ends here

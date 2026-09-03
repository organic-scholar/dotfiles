;;; init-rust.el --- Rust development -*- lexical-binding: t; -*-

(require 'use-package)

(use-package eglot
  :ensure nil
  :demand t)

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :hook (rust-mode . eglot-ensure))

(provide 'init-rust)
;;; init-rust.el ends here

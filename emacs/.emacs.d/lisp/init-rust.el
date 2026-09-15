;;; init-rust.el --- Rust development -*- lexical-binding: t; -*-

(require 'use-package)

(use-package eglot
  :ensure nil
  :demand t)

(use-package treesit
  :ensure nil
  :config
  (add-to-list 'treesit-language-source-alist
               '(rust . ("https://github.com/tree-sitter/tree-sitter-rust"))))

(use-package rust-mode
  :ensure t)

(use-package rust-ts-mode
  :ensure nil
  :mode "\\.rs\\'"
  :hook (rust-ts-mode . eglot-ensure))

(provide 'init-rust)
;;; init-rust.el ends here

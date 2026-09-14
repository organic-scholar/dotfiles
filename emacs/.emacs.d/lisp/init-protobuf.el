;;; init-protobuf.el --- Protocol Buffers support -*- lexical-binding: t; -*-

(require 'use-package)

(use-package protobuf-mode
  :ensure t
  :mode "\\.proto\\'")

(provide 'init-protobuf)
;;; init-protobuf.el ends here

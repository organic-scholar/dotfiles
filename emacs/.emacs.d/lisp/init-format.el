;;; init-format.el --- Format buffers on save -*- lexical-binding: t; -*-

(require 'use-package)

(use-package apheleia
  :ensure t
  :config
  (apheleia-global-mode 1))

(provide 'init-format)
;;; init-format.el ends here

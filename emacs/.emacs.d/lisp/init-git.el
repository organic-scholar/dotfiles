;;; init-git.el --- Git integration -*- lexical-binding: t; -*-

(require 'use-package)

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status))

(provide 'init-git)
;;; init-git.el ends here

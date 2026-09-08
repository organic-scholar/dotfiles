;;; init-git.el --- Git integration -*- lexical-binding: t; -*-

(require 'use-package)

(use-package magit
  :ensure t
  :init
  ;; Reuse the current window for status and most Magit views.  Diffs and
  ;; process output still use another window so they can be read alongside it.
  (setq magit-display-buffer-function
        #'magit-display-buffer-same-window-except-diff-v1)
  :bind ("C-c g" . magit-status))

(provide 'init-git)
;;; init-git.el ends here

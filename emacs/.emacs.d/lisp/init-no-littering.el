;;; init-no-littering.el --- Keep ~/.emacs.d tidy -*- lexical-binding: t; -*-

;; Redirect generated state into var/ and config into etc/. Must load
;; before packages that create state files (recentf, savehist, etc.).
(use-package no-littering
  :ensure t
  :init
  (setq no-littering-etc-directory (expand-file-name "etc/" user-emacs-directory)
        no-littering-var-directory (expand-file-name "var/" user-emacs-directory))
  :config
  ;; Store auto-save files under var/ as well.
  (no-littering-theme-backups))

(provide 'init-no-littering)
;;; init-no-littering.el ends here

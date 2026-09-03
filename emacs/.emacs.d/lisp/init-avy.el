;;; init-avy.el --- Fast visible-text navigation -*- lexical-binding: t; -*-

(require 'use-package)

(use-package avy
  :ensure t
  :bind ("C-c j" . avy-goto-char-timer))

(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(setq avy-background t)

(custom-set-faces
 '(avy-background-face ((t (:foreground "gray45")))))

(provide 'init-avy)
;;; init-avy.el ends here

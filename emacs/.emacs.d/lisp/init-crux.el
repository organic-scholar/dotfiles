;;; init-crux.el --- Extra editing commands -*- lexical-binding: t; -*-

(require 'use-package)

(use-package crux
  :ensure t
  :demand t)

;; Toggle between the first non-whitespace character and column zero.
(pcase system-type
  ('darwin
   (global-set-key (kbd "s-<left>") #'crux-move-beginning-of-line))
  ('gnu/linux
   (global-set-key (kbd "<home>") #'crux-move-beginning-of-line)))

(provide 'init-crux)
;;; init-crux.el ends here

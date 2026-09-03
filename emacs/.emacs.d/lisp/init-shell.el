;;; shell.el --- Personal shell keybindings -*- lexical-binding: t; -*-

(defvar-keymap my/shell-command-map
  "s" #'shell
  "e" #'eshell)


;; Use arrows for buffer navigation and C-p/C-n for command history in Eshell.
(with-eval-after-load 'em-hist
  (keymap-set eshell-hist-mode-map "<up>" #'previous-line)
  (keymap-set eshell-hist-mode-map "<down>" #'next-line)
  (keymap-set eshell-hist-mode-map "C-p" #'eshell-previous-input)
  (keymap-set eshell-hist-mode-map "C-n" #'eshell-next-input))

(define-key global-map (kbd "C-c T") my/shell-command-map)

(provide 'init-shell)
;;; shell.el ends here

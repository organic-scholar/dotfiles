;;; shell.el --- Personal shell keybindings -*- lexical-binding: t; -*-

(defun init-eshell-disable-line-numbers ()
  "Disable line numbers in Eshell buffers."
  (display-line-numbers-mode -1))

(defun init-eshell-projectile ()
  "Open an Eshell buffer in the current Projectile project when possible."
  (interactive)
  (if (and (fboundp 'projectile-project-p)
           (projectile-project-p))
      (call-interactively #'projectile-run-eshell)
    (call-interactively #'eshell)))

(defun init-eshell-projectile-new ()
  "Open a new Eshell buffer in the current Projectile project when possible."
  (interactive)
  (if (and (fboundp 'projectile-project-p)
           (projectile-project-p))
      (projectile-run-eshell t)
    (let ((current-prefix-arg t))
      (call-interactively #'eshell))))

(defvar-keymap my/shell-command-map
  "s" #'shell
  "e" #'init-eshell-projectile
  "E" #'init-eshell-projectile-new)


(add-hook 'eshell-mode-hook #'init-eshell-disable-line-numbers)

;; Use arrows for buffer navigation and C-p/C-n for command history in Eshell.
(with-eval-after-load 'em-hist
  (keymap-set eshell-hist-mode-map "<up>" #'previous-line)
  (keymap-set eshell-hist-mode-map "<down>" #'next-line)
  (keymap-set eshell-hist-mode-map "C-p" #'eshell-previous-input)
  (keymap-set eshell-hist-mode-map "C-n" #'eshell-next-input))

(define-key global-map (kbd "C-c T") my/shell-command-map)

(provide 'init-shell)
;;; shell.el ends here

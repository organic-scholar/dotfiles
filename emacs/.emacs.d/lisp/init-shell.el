;;; shell.el --- Personal shell keybindings -*- lexical-binding: t; -*-

(defun init-eshell-disable-line-numbers ()
  "Disable line numbers in Eshell buffers."
  (display-line-numbers-mode -1))

(defun init-eshell-desktop-save (_desktop-dir)
  "Return the working directory needed to recreate an Eshell buffer."
  (list default-directory))

(defun init-eshell-desktop-restore (_file-name buffer-name misc)
  "Create an Eshell named BUFFER-NAME in the saved directory from MISC."
  (let ((directory (car misc)))
    (when (file-directory-p directory)
      (let ((default-directory directory)
            (buffer (get-buffer-create buffer-name)))
        (with-current-buffer buffer
          (setq default-directory directory)
          (unless (derived-mode-p 'eshell-mode)
            (eshell-mode)))
        buffer))))

(defun init-eshell-enable-desktop-saving ()
  "Save enough state for desktop.el to recreate this Eshell buffer."
  (setq-local desktop-save-buffer #'init-eshell-desktop-save))

(defun init-eshell-enable-desktop-saving-in-existing-buffers ()
  "Enable desktop saving for Eshell buffers that are already open."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'eshell-mode)
        (init-eshell-enable-desktop-saving)))))

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
(add-hook 'eshell-mode-hook #'init-eshell-enable-desktop-saving)

(with-eval-after-load 'esh-mode
  (init-eshell-enable-desktop-saving-in-existing-buffers))

(with-eval-after-load 'desktop
  (add-to-list 'desktop-buffer-mode-handlers
               '(eshell-mode . init-eshell-desktop-restore)))

;; Use arrows for buffer navigation and C-p/C-n for command history in Eshell.
(with-eval-after-load 'em-hist
  (keymap-set eshell-hist-mode-map "<up>" #'previous-line)
  (keymap-set eshell-hist-mode-map "<down>" #'next-line)
  (keymap-set eshell-hist-mode-map "C-p" #'eshell-previous-input)
  (keymap-set eshell-hist-mode-map "C-n" #'eshell-next-input))

(define-key global-map (kbd "C-c T") my/shell-command-map)

(provide 'init-shell)
;;; shell.el ends here

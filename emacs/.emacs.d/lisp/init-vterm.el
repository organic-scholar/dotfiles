;;; init-vterm.el --- Terminal emulator -*- lexical-binding: t; -*-

(require 'use-package)

(defun init-vterm-disable-line-numbers ()
  "Apply Vterm-specific display and keymap settings."
  (display-line-numbers-mode -1)
  ;; Let Vterm's C-v binding take precedence over CUA's global paste command.
  (setq-local cua-inhibit-cua-keys t))

(defun init-vterm-default-cursor-to-bar (args)
  "Translate Vterm's default-cursor request in ARGS to a steady bar."
  (let ((input (cadr args)))
    (when (string-search "\e[0 q" input)
      (setf (cadr args)
            (string-replace "\e[0 q" "\e[6 q" input))))
  args)

(defun init-vterm-desktop-save (_desktop-dir)
  "Return the working directory needed to recreate a Vterm buffer."
  (list default-directory))

(defun init-vterm-desktop-restore (_file-name buffer-name misc)
  "Create a fresh Vterm named BUFFER-NAME in the saved directory from MISC."
  (let ((directory (car misc)))
    (when (file-directory-p directory)
      (let ((default-directory directory)
            (buffer (get-buffer-create buffer-name)))
        (with-current-buffer buffer
          (unless (derived-mode-p 'vterm-mode)
            (vterm-mode)))
        buffer))))

(defun init-vterm-enable-desktop-saving ()
  "Save enough state for desktop.el to recreate this Vterm buffer."
  (setq-local desktop-save-buffer #'init-vterm-desktop-save))

(defun init-vterm-enable-desktop-saving-in-existing-buffers ()
  "Enable desktop saving for Vterm buffers that are already open."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'vterm-mode)
        (init-vterm-enable-desktop-saving)))))

(use-package vterm
  :ensure t
  :commands vterm
  :hook ((vterm-mode . init-vterm-disable-line-numbers)
         (vterm-mode . init-vterm-enable-desktop-saving))
  :custom
  (vterm-max-scrollback 10000)
  (vterm-min-window-width 20)
  :config
  ;; Globally C-y is bound to redo; in Vterm it must paste into the terminal.
  )

;; The shell prefix map is defined by init-shell; Vterm owns its own entry.
(with-eval-after-load 'init-shell
  (keymap-set my/shell-command-map "v" #'vterm))

(with-eval-after-load 'vterm
  (advice-add #'vterm--filter
              :filter-args
              #'init-vterm-default-cursor-to-bar)
  (keymap-set vterm-mode-map "s-v" #'vterm-yank)
  (keymap-set vterm-mode-map "C-c e" #'vterm-copy-mode)
  (init-vterm-enable-desktop-saving-in-existing-buffers))

(with-eval-after-load 'desktop
  (add-to-list 'desktop-buffer-mode-handlers
               '(vterm-mode . init-vterm-desktop-restore)))


(provide 'init-vterm)
;;; init-vterm.el ends here

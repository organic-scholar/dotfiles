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

(use-package vterm
  :ensure t
  :commands vterm
  :hook (vterm-mode . init-vterm-disable-line-numbers)
  :custom
  (vterm-max-scrollback 10000)
  (vterm-min-window-width 20)
  :config
  ;; Globally C-y is bound to redo; in Vterm it must paste into the terminal.
  )

(with-eval-after-load 'vterm
  (advice-add #'vterm--filter
              :filter-args
              #'init-vterm-default-cursor-to-bar)
  (keymap-set vterm-mode-map "s-v" #'vterm-yank)
  (keymap-set vterm-mode-map "C-c e" #'vterm-copy-mode))


(provide 'init-vterm)
;;; init-vterm.el ends here

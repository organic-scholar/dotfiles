;;; init-keymap.el --- Global keybindings -*- lexical-binding: t; -*-

(global-set-key (kbd "<escape>") #'keyboard-quit)
(define-key ctl-x-map (kbd "<escape>") #'keyboard-quit)
(global-set-key (kbd "C-c <escape>") #'keyboard-quit)


;; Some minibuffer maps shadow global keys, so make Escape consistently abort
;; prompts such as Copilot's file-reference picker.
(keymap-set minibuffer-local-map "<escape>" #'abort-recursive-edit)

;; Undo/redo using the conventional Linux/Windows and macOS shortcuts.
;; On macOS, Emacs maps the Command key to the `super' modifier by default.
(global-set-key (kbd "C-z") #'undo-only)
(global-set-key (kbd "C-y") #'undo-redo)
(global-set-key (kbd "C-S-z") #'undo-redo)
(global-set-key (kbd "s-z") #'undo-only)
(global-set-key (kbd "s-Z") #'undo-redo)

;; Conventional macOS clipboard shortcuts (Command maps to `super').
(global-set-key (kbd "s-c") #'kill-ring-save)
(global-set-key (kbd "s-x") #'kill-region)
(global-set-key (kbd "s-v") #'yank)

;; macOS document navigation: Command-Up/Down jump to buffer start/end.
(global-set-key (kbd "s-<up>") #'beginning-of-buffer)
(global-set-key (kbd "s-<down>") #'end-of-buffer)

(provide 'init-keymap)



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

(provide 'init-keymap)

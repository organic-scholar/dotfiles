;;; tabs.el --- Personal tab-bar configuration -*- lexical-binding: t; -*-


(tab-bar-mode 1)

(defvar-keymap my/tab-bar-command-map
  "o" #'my/projectile-open-in-new-tab
  "p" #'tab-bar-switch-to-prev-tab
  "n" #'tab-bar-switch-to-next-tab
  "s" #'tab-bar-switch-to-tab
  "r" #'tab-bar-rename-tab
  "q" #'tab-bar-close-tab
  "u" #'tab-bar-undo-close-tab)

;; `prelude-mode' otherwise assigns C-c t to its terminal command.
(define-key global-map (kbd "C-c t") my/tab-bar-command-map)

(provide 'init-tabs)
;;; tabs.el ends here

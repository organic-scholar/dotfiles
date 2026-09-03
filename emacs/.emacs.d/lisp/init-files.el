(require 'recentf)
(require 'savehist)

;; Preserve minibuffer history and recently visited files between sessions.
(savehist-mode 1)
(recentf-mode 1)

(defvar-keymap my/project-file-command-map
  "f" #'projectile-find-file
  "b" #'projectile-switch-to-buffer
  "r" #'projectile-recentf
  "d" #'projectile-dired
  "g" #'projectile-grep
  "s" #'projectile-ripgrep)



(define-key global-map (kbd "C-c f") my/project-file-command-map)

(provide 'init-files)

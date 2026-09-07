;;; tabs.el --- Personal tab-bar configuration -*- lexical-binding: t; -*-


(tab-bar-mode 1)

(require 'project)

(defun init-tab-bar-project-name ()
  "Name automatically generated tabs after the selected buffer's project.
Outside a project, fall back to the selected buffer's name.  A manually
renamed tab remains unchanged because `tab-bar-rename-tab' stores its name."
  (if-let* ((project (project-current nil))
            (root (project-root project)))
      (file-name-nondirectory (directory-file-name root))
    (buffer-name)))

;; The Emacs default follows the selected buffer, making a tab's label change
;; while moving between files.  Use the project name for automatic tab labels.
(setq tab-bar-tab-name-function #'init-tab-bar-project-name)

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

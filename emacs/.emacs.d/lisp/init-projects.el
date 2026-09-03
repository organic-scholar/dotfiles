;; Project navigation with Projectile.
(require 'use-package)

(use-package projectile
  :ensure t
  :demand t
  :custom
  ;; Use Emacs's completion API, which Vertico enhances.
  (projectile-completion-system 'default)
  :config
  ;; Omit common dependency, cache, and build-output directories.
  (dolist (directory '("node_modules"
                       "bower_components"
                       ".pnpm-store"
                       ".yarn"
                       "target"
                       "build"
                       "dist"
                       ".next"
                       "cdk.out"
                       "android"
                       "ios"
                       ".cache"
                       ".mypy_cache"
                       ".pytest_cache"
                       ".venv"
                       "venv"
                       "__pycache__"
                       ".tox"
                       ".git"
                       "eln-cache"
                       "elpa"
                       "var"
                       "straight"
                       "quelpa"
                       "auto-save-list"
                       "backups"
                       "eshell"
                       "transient"
                       "tree-sitter"))
    (add-to-list 'projectile-globally-ignored-directories directory))
  ;; Ignore editor backup and auto-save files at any project depth.
  (dolist (file '("*~" "#*#"))
    (add-to-list 'projectile-globally-ignored-files file))
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") projectile-command-map))

(defun init/find-file ()
  "Find a project file, or use normal file selection outside a project."
  (interactive)
  (if (projectile-project-p)
      (call-interactively #'projectile-find-file)
    (call-interactively #'find-file)))

(global-set-key (kbd "C-x C-f") #'init/find-file)

(defun my/projectile-open-in-new-tab ()
  "Open a Projectile project in a new named tab."
  (interactive)
  (tab-bar-new-tab)
  (let ((project (projectile-completing-read
                   "Switch to project: "
                   (projectile-relevant-known-projects))))
    (projectile-switch-project-by-name project)
    (tab-bar-rename-tab (projectile-project-name))))

;; Keep Projectile's `C-c p t' toggle command; use `C-c p C-t' for tabs.
(define-key projectile-command-map (kbd "t") #'my/projectile-open-in-new-tab)

(defun my/projectile-switch-project ()
  "Switch to a Projectile project without opening a new tab."
  (interactive)
  (let ((project (projectile-completing-read
                   "Switch to project: "
                   (projectile-relevant-known-projects))))
    (projectile-switch-project-by-name project)
    (tab-bar-rename-tab (projectile-project-name))
    ))

(provide 'init-projects)

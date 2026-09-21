;;; init-projects.el --- Project navigation -*- lexical-binding: t; -*-

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

(defun my/projectile--normalize-project-root (project)
  "Return a canonical directory name for PROJECT."
  (file-name-as-directory (expand-file-name project)))

(defun my/projectile--project-tab (project)
  "Return the tab associated with PROJECT, if one exists."
  (let ((root (my/projectile--normalize-project-root project))
        (name (projectile-project-name project)))
    (seq-find
     (lambda (tab)
       (let ((tab-root (alist-get 'project-root (cdr tab))))
         (if tab-root
             (equal root tab-root)
           (equal name (alist-get 'name (cdr tab))))))
     (tab-bar-tabs))))

(defun my/projectile--set-current-tab-project (project)
  "Associate the current tab with PROJECT."
  (let ((tab (tab-bar--current-tab-find))
        (root (my/projectile--normalize-project-root project)))
    (setcdr tab (cons (cons 'project-root root)
                      (assq-delete-all 'project-root (cdr tab))))))

(defun my/projectile-open-in-new-tab ()
  "Select a project tab, creating its split layout when needed."
  (interactive)
  (let ((project (projectile-completing-read
                  "Switch to project: "
                  (projectile-relevant-known-projects))))
    (if-let* ((tab (my/projectile--project-tab project)))
        (progn
          (tab-bar-select-tab
           (1+ (seq-position (tab-bar-tabs) tab #'eq)))
          ;; Add root metadata when an older tab was matched by its name.
          (my/projectile--set-current-tab-project project))
      (tab-bar-new-tab)
      (projectile-switch-project-by-name project)
      (tab-bar-rename-tab (projectile-project-name))
      (my/projectile--set-current-tab-project project)
      ;; Create a two-level split: bottom pane fixed at 10 lines and right
      ;; pane fixed at 40 columns.
      (let ((bottom (split-window-below -10))
            (right (split-window-right -40)))
        (select-window right)
        (projectile-run-vterm)
        (select-window bottom)
        (projectile-run-eshell)))))

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

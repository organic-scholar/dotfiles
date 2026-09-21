;;; init-treemacs.el --- Project tree sidebar -*- lexical-binding: t; -*-

(require 'use-package)

(defun init-treemacs-clean-window ()
  "Apply Treemacs-specific display settings."
  (text-scale-set 0)
  (display-line-numbers-mode -1)
  (setq-local mode-line-format nil)
  (force-mode-line-update))

(defun init-treemacs--set-current-tab-visible (visible)
  "Record VISIBLE as the Treemacs state of the current tab."
  (let ((tab (tab-bar--current-tab-find)))
    (setcdr tab (assq-delete-all 'treemacs-visible (cdr tab)))
    (when visible
      (setcdr tab (cons '(treemacs-visible . t) (cdr tab))))))

(defun init-treemacs-current-project ()
  "Toggle Treemacs for the current project in this tab."
  (interactive)
  (require 'treemacs)
  (pcase (treemacs-current-visibility)
    ('visible
     (delete-window (treemacs-get-local-window))
     (init-treemacs--set-current-tab-visible nil))
    (_
     (treemacs-add-and-display-current-project-exclusively)
     (init-treemacs--set-current-tab-visible t))))

(defun init-treemacs-restore-tab-sidebars ()
  "Restore Treemacs in tabs where it was visible in the saved desktop."
  (require 'treemacs)
  (let ((selected-tab (tab-bar--current-tab-index))
        (tab-count (length (tab-bar-tabs))))
    (unwind-protect
        (dotimes (index tab-count)
          (tab-bar-select-tab (1+ index))
          (let* ((selected-window (selected-window))
                 (tab (tab-bar--current-tab-find))
                 (visible (alist-get 'treemacs-visible (cdr tab)))
                 (project-root (alist-get 'project-root (cdr tab))))
            (when (and visible
                       (not (eq (treemacs-current-visibility) 'visible)))
              (let ((default-directory
                     (if (and project-root (file-directory-p project-root))
                         project-root
                       default-directory)))
                (condition-case nil
                    (treemacs-add-and-display-current-project-exclusively)
                  (error nil))))
            (when (window-live-p selected-window)
              (select-window selected-window))))
      (tab-bar-select-tab (1+ selected-tab)))))

(defun init-treemacs-save-tab-sidebars ()
  "Record Treemacs visibility in every tab before desktop saving."
  (when (featurep 'treemacs)
    (let ((selected-tab (tab-bar--current-tab-index))
          (tab-count (length (tab-bar-tabs))))
      (unwind-protect
          (dotimes (index tab-count)
            (tab-bar-select-tab (1+ index))
            (init-treemacs--set-current-tab-visible
             (eq (treemacs-current-visibility) 'visible)))
        (tab-bar-select-tab (1+ selected-tab))))))

(defun init-treemacs-ignore-follow-errors (follow &rest args)
  "Run FOLLOW and ignore files that cannot be found in the current tree."
  (condition-case nil
      (apply follow args)
    (error nil)))

(use-package treemacs
  :ensure t
  :defer t
  :hook (treemacs-mode . init-treemacs-clean-window)
  :init
  (keymap-set global-map "C-c e" #'init-treemacs-current-project)
  :custom
  (treemacs-width 32)
  ;; Do not let a saved Customize value restore Treemacs's button header.
  (treemacs-user-header-line-format nil)
  ;; The bottom `Treemacs: Default' status line is separate from the header.
  (treemacs-user-mode-line-format 'none)
  ;; Avoid a global idle follow timer racing against tab/workspace creation.
  (treemacs-follow-after-init nil)
  :custom-face
  (treemacs-directory-face ((t (:inherit default))))
  (treemacs-directory-collapsed-face ((t (:inherit default))))
  (treemacs-file-face ((t (:inherit default))))
  (treemacs-git-unmodified-face ((t (:inherit default))))
  (treemacs-git-ignored-face ((t (:inherit default))))
  :config
  ;; Projectile already owns C-c p; use its uppercase T entry for the tree.
  (when (boundp 'projectile-command-map)
    (keymap-set projectile-command-map "T" #'init-treemacs-current-project))
  (advice-add 'treemacs--follow :around #'init-treemacs-ignore-follow-errors)
  (treemacs-follow-mode 1)
  ;; This mode owns `treemacs-user-header-line-format'.  Disable it in case
  ;; it was previously enabled through Customize.
  (when (bound-and-true-p treemacs-indicate-top-scroll-mode)
    (treemacs-indicate-top-scroll-mode -1))
  ;; Refresh the tree when files are changed outside Emacs.
  (treemacs-filewatch-mode 1)
  ;; Treemacs adds itself to Ace Window's ignore list by default.
  (when (boundp 'aw-ignored-buffers)
    (setq aw-ignored-buffers
          (delq 'treemacs-mode aw-ignored-buffers))))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

(use-package treemacs-tab-bar
  :ensure t
  :after treemacs
  :config
  (treemacs-set-scope-type 'Tabs))

(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))

(with-eval-after-load 'desktop
  (add-hook 'desktop-save-hook #'init-treemacs-save-tab-sidebars)
  (add-hook 'desktop-after-read-hook #'init-treemacs-restore-tab-sidebars))

(provide 'init-treemacs)
;;; init-treemacs.el ends here

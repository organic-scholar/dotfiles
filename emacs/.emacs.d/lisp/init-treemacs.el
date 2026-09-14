;;; init-treemacs.el --- Project tree sidebar -*- lexical-binding: t; -*-

(require 'use-package)

(defun init-treemacs-clean-window ()
  "Apply Treemacs-specific display settings."
  (text-scale-set 0)
  (display-line-numbers-mode -1)
  (setq-local mode-line-format nil)
  (force-mode-line-update))

(defun init-treemacs-current-project ()
  "Toggle Treemacs for the current project in this tab."
  (interactive)
  (require 'treemacs)
  (pcase (treemacs-current-visibility)
    ('visible (delete-window (treemacs-get-local-window)))
    (_ (treemacs-add-and-display-current-project-exclusively))))

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

(provide 'init-treemacs)
;;; init-treemacs.el ends here

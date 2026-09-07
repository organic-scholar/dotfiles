;;; init-header-line.el --- Project path in the header line -*- lexical-binding: t; -*-

;; Display a project-relative file path in file-visiting buffers, falling back
;; to an abbreviated absolute path outside a project.
(require 'project)

(defvar-local init-header-line-active-p t
  "Non-nil when this buffer is shown in the selected window.")

(defun init-header-line-update-window-state (frame)
  "Update header-line faces for the windows displayed on FRAME."
  (dolist (window (window-list frame 'nomini))
    (with-current-buffer (window-buffer window)
      (setq-local init-header-line-active-p
                  (eq window (frame-selected-window frame))))))

;; Emacs 30 has no built-in inactive-header-line face.  Track selection so
;; inactive windows can use the theme's comment color instead.
(add-hook 'window-selection-change-functions
          #'init-header-line-update-window-state)
(add-hook 'window-state-change-functions
          #'init-header-line-update-window-state)

(defun init-header-line-file-path ()
  "Return the current buffer's file path for the header line."
  (when buffer-file-name
    (let* ((project (project-current nil))
           (root (and project (project-root project)))
           (path (if root
                     (file-relative-name buffer-file-name root)
                   (abbreviate-file-name buffer-file-name))))
      (propertize path 'face (if init-header-line-active-p
                                 'header-line
                               'font-lock-comment-face)))))

;; Enable this when you want the project path shown above file buffers.
(setq-default header-line-format
               '((:eval (init-header-line-file-path))))

(provide 'init-header-line)
;;; init-header-line.el ends here

;;; desktop.el --- Restore tabs, windows, and project buffers -*- lexical-binding: t; -*-

;; `desktop-save-mode' records visited files and the frame configuration.  A
;; tab-bar tab is a named window configuration, so this also restores every
;; open tab (its name, selected tab, windows, buffers, and split sizes).
;; Keep generated state outside the configuration root.
(require 'desktop)

(defconst init-desktop-directory
  (expand-file-name "var/desktop/" user-emacs-directory)
  "Directory where Emacs saves desktop session state.")

(make-directory init-desktop-directory t)

(setq desktop-dirname init-desktop-directory
      desktop-path (list init-desktop-directory)
      desktop-save t
      desktop-restore-frames t
      desktop-auto-save-timeout 300)

(desktop-save-mode 1)

(provide 'init-desktop)
;;; desktop.el ends here

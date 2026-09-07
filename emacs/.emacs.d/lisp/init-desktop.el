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

;; Never save or restore appearance parameters in the frameset so the active
;; theme controls colors.  Otherwise a session captured under a light theme
;; restores a white background that overrides the current theme.
(require 'frameset)
(setq frameset-filter-alist
      (append '((foreground-color . :never)
                (background-color . :never)
                (background-mode  . :never)
                (cursor-color     . :never)
                (ns-appearance    . :never))
              frameset-filter-alist))

(desktop-save-mode 1)

(provide 'init-desktop)
;;; desktop.el ends here

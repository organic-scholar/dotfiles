;;; init-package.el --- Package management setup -*- lexical-binding: t; -*-

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Fetch package metadata only when a local archive cache is unavailable.
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)

(provide 'init-package)
;;; init-package.el ends here

;;; init-markdown.el --- Markdown editing -*- lexical-binding: t; -*-

(require 'use-package)

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" ("README\\.md\\'" . gfm-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'init-markdown)
;;; init-markdown.el ends here

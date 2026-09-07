;;; init-yaml.el --- YAML editing -*- lexical-binding: t; -*-

(require 'use-package)

(use-package yaml-mode
  :ensure t
  :mode ("\\.ya?ml\\'" "\\.yamllint\\'")
  :hook (yaml-mode . eglot-ensure)
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(yaml-mode . ("yaml-language-server" "--stdio")))))

(provide 'init-yaml)
;;; init-yaml.el ends here

;;; init-typescript.el --- TypeScript development -*- lexical-binding: t; -*-

(require 'use-package)

(use-package treesit
  :ensure nil
  :config
  (add-to-list 'treesit-language-source-alist
               '(typescript . ("https://github.com/tree-sitter/tree-sitter-typescript"
                               "master" "typescript/src")))
  (add-to-list 'treesit-language-source-alist
               '(tsx . ("https://github.com/tree-sitter/tree-sitter-typescript"
                        "master" "tsx/src"))))

(use-package typescript-ts-mode
  :ensure nil
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.mts\\'" . typescript-ts-mode)
         ("\\.cts\\'" . typescript-ts-mode))
  :hook (typescript-ts-mode . eglot-ensure))

(use-package tsx-ts-mode
  :ensure nil
  :mode (("\\.tsx\\'" . tsx-ts-mode)
         ("\\.jsx\\'" . tsx-ts-mode))
  :hook (tsx-ts-mode . eglot-ensure))

(provide 'init-typescript)
;;; init-typescript.el ends here

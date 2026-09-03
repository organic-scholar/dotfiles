;;; init-spell.el --- Spell checking -*- lexical-binding: t; -*-

(require 'use-package)

(use-package flyspell
  :ensure nil
  :hook ((text-mode . flyspell-mode)
         (prog-mode . flyspell-prog-mode)))

(provide 'init-spell)
;;; init-spell.el ends here

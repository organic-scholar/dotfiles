;;; init-clojure.el --- Clojure development -*- lexical-binding: t; -*-

(require 'use-package)

(use-package clojure-mode
  :ensure t
  :mode (("\\.clj\\'" . clojure-mode)
         ("\\.cljs\\'" . clojurescript-mode)
         ("\\.cljc\\'" . clojurec-mode)
         ("\\.edn\\'" . clojure-mode)))

(use-package cider
  :ensure t
  :commands (cider-jack-in cider-jack-in-cljs cider-connect-clj cider-connect-cljs))

(provide 'init-clojure)
;;; init-clojure.el ends here

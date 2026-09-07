;;; init-helm.el --- Helm chart editing -*- lexical-binding: t; -*-

(require 'use-package)
(require 'yaml-mode)

;; Distinct major mode so helm_ls only runs on Helm templates, not plain YAML.
(define-derived-mode helm-chart-mode yaml-mode "Helm"
  "Major mode for editing Kubernetes Helm chart templates.")

;; Helm templates live under a chart's templates/ dir; .tpl are helper files.
(add-to-list 'auto-mode-alist '("/templates/.*\\.ya?ml\\'" . helm-chart-mode))
(add-to-list 'auto-mode-alist '("/templates/.*\\.tpl\\'" . helm-chart-mode))

(add-hook 'helm-chart-mode-hook #'eglot-ensure)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(helm-chart-mode "helm_ls" "serve")))

(provide 'init-helm)
;;; init-helm.el ends here

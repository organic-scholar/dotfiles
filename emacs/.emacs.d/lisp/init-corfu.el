;;; init-corfu.el --- In-buffer completion popup -*- lexical-binding: t; -*-

(require 'use-package)


(use-package corfu
  :ensure t
  :init
  ;; Keep Vertico responsible for minibuffer completion.
  (setq global-corfu-minibuffer nil)
  :config
  ;; Load the auto-completion options before enabling Corfu globally.
  (require 'corfu-auto)
  ;; Auto-complete only following common code-access characters.  A large
  ;; prefix threshold prevents ordinary identifiers from opening the popup.
  (setq corfu-auto t
        corfu-auto-delay 0.2
        corfu-auto-trigger ".:"
        corfu-auto-prefix most-positive-fixnum)
  (global-corfu-mode 1))

(defun init-corfu-nerd-icons-formatter (metadata)
  "Format Corfu icons with a full space separating them from candidates."
  (when-let ((formatter (nerd-icons-corfu-formatter metadata)))
    (lambda (candidate)
      (let ((nerd-icons-corfu--space " "))
        (funcall formatter candidate)))))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (setf (alist-get 'boolean nerd-icons-corfu-mapping)
        '(:style "cod" :icon "symbol_boolean" :face font-lock-builtin-face))
  (setf (alist-get 'method nerd-icons-corfu-mapping)
        '(:style "md" :icon "function_variant" :face font-lock-function-name-face))
  (add-to-list 'corfu-margin-formatters #'init-corfu-nerd-icons-formatter)
  )

(defun init-corfu-enable-elisp-auto-completion ()
  "Offer completion after two symbol characters in Emacs Lisp buffers."
  (setq-local corfu-auto-trigger ""
              corfu-auto-prefix 2))

(add-hook 'emacs-lisp-mode-hook #'init-corfu-enable-elisp-auto-completion)
(add-hook 'lisp-interaction-mode-hook #'init-corfu-enable-elisp-auto-completion)

(provide 'init-corfu)
;;; init-corfu.el ends here

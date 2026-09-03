(use-package copilot
  :ensure t
  :hook (prog-mode . copilot-mode)
  :config
  (keymap-set copilot-completion-map "C-<tab>" #'copilot-accept-completion-by-word)
  (keymap-set copilot-completion-map "<right>" #'copilot-accept-completion)
  (keymap-set copilot-completion-map "M-<right>" #'copilot-accept-completion-by-word)
  (keymap-set copilot-completion-map "<end>" #'copilot-accept-completion-by-line)
  (keymap-set copilot-completion-map "M-n" #'copilot-next-completion)
  (keymap-set copilot-completion-map "M-p" #'copilot-previous-completion)
  (keymap-unset copilot-completion-map "<tab>")
  (keymap-unset copilot-completion-map "TAB")
  
  ;; `copilot.el' cannot infer these tree-sitter modes' indentation width.
  ;; Supplying it keeps ghost-text suggestions aligned with our formatting.
  (add-to-list 'copilot-indentation-alist '(prog-mode . 2))
  (add-to-list 'copilot-indentation-alist '(org-mode . 2))
  (add-to-list 'copilot-indentation-alist '(text-mode . 2))
  (add-to-list 'copilot-indentation-alist '(closure-mode . 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode . 2))
  ;; Suppress Copilot's fallback-to-`tab-width' diagnostic for modes that
  ;; do not expose a mode-specific indentation offset.
  ;; add-to-list 'warning-suppress-types '(copilot copilot-no-mode-indent)))
  )

(dolist (command '(copilot-chat-compose
                   copilot-chat-send
                   copilot-chat-send-region
                   copilot-chat-review
                   copilot-chat-fix
                   copilot-chat-doc
                   copilot-chat-write-tests
                   copilot-chat-display
                   copilot-chat-stop
                   copilot-chat-reset))
  (autoload command "copilot-chat" nil t))

(defvar-keymap my/copilot-chat-command-map
  "c" #'copilot-chat-compose
  "s" #'copilot-chat-send
  "r" #'copilot-chat-send-region
  "v" #'copilot-chat-review
  "f" #'copilot-chat-fix
  "d" #'copilot-chat-doc
  "t" #'copilot-chat-write-tests
  "p" #'copilot-chat-display
  "x" #'copilot-chat-stop
  "k" #'copilot-chat-reset)

;; Replaces the existing Org/Counsel `C-c a' binding.
(define-key global-map (kbd "C-c a") my/copilot-chat-command-map)

(provide 'init-copilot)

;;; cua.el --- Personal CUA configuration -*- lexical-binding: t; -*-

(cua-mode 1)
(setq shift-select-mode t)
(transient-mark-mode 1)

(defun my-deactivate-empty-shift-selection (&rest _ignored)
  "Deactivate a shifted selection when it contains no text."
  (when (and mark-active
             (= (point) (mark))
             (bound-and-true-p this-command-keys-shift-translated))
    (deactivate-mark)))

(advice-add 'move-beginning-of-line :after
            #'my-deactivate-empty-shift-selection)
(advice-add 'move-end-of-line :after
            #'my-deactivate-empty-shift-selection)

(provide 'init-cua)
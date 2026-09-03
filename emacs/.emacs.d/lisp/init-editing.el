;;; init-editing.el --- General editing behavior -*- lexical-binding: t; -*-

(electric-pair-mode 1)

(use-package super-save
  :ensure t
  :demand t
  :config
  (super-save-mode 1))

(defun init/backward-kill-word-or-line (arg)
  "Delete backward ARG times using VS Code-like boundaries."
  (interactive "p")
  (dotimes (_ arg)
    (let* ((bol (line-beginning-position))
           (space-start (save-excursion
                          (skip-chars-backward " \t" bol)
                          (point))))
      (cond
       ((bobp))
       ((bolp) (delete-char -1))
       ((and (< space-start (point))
             (or (= space-start bol) (> (- (point) space-start) 1)))
        (delete-region space-start (point)))
       (t
        (save-restriction
          (narrow-to-region bol (point))
          (backward-kill-word 1)))))))

(global-set-key (kbd "C-<backspace>") #'init/backward-kill-word-or-line)

(provide 'init-editing)
;;; init-editing.el ends here

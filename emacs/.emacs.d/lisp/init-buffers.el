(defun init/kill-current-buffer ()
  "Save the current file buffer, then kill it."
  (interactive)
  (when (and buffer-file-name (buffer-modified-p))
    (save-buffer))
  (kill-current-buffer))

(defvar-keymap my/buffer-command-map
  "e" #'eval-buffer
  "k" #'init/kill-current-buffer
  "d" #'init/kill-current-buffer)


(define-key global-map (kbd "C-c b") my/buffer-command-map)

(provide 'init-buffers)

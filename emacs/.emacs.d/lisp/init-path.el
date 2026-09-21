;;; init-path.el --- Import executable paths from Zsh -*- lexical-binding: t; -*-

(require 'subr-x)

(defconst init-path-zsh-file
  (expand-file-name "dotfiles/zsh/lib/paths.zsh" "~")
  "Zsh file that defines the PATH used by Emacs.")

(defun init-path-import-from-zsh ()
  "Import PATH from `init-path-zsh-file' into Emacs."
  (when (file-readable-p init-path-zsh-file)
    (with-temp-buffer
      (let ((status
             (process-file
              "/usr/bin/zsh" nil t nil "-f" "-c"
              "source \"$1\"; printf %s \"$PATH\""
              "zsh" init-path-zsh-file)))
        (when (zerop status)
          (let* ((path (string-trim-right (buffer-string)))
                 (directories (delete-dups (parse-colon-path path))))
            (unless (string-empty-p path)
              (setq exec-path directories)
              (setenv "PATH"
                      (mapconcat #'directory-file-name directories
                                 path-separator)))))))))

(init-path-import-from-zsh)

(provide 'init-path)
;;; init-path.el ends here

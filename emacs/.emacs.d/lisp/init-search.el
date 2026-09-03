;;; init-search.el --- Search key bindings -*- lexical-binding: t; -*-

;; Keep buffer-search commands together under a dedicated `C-c s' prefix.
(define-prefix-command 'init/search-map)
(global-set-key (kbd "C-c s") #'init/search-map)
(define-key init/search-map (kbd "f") #'isearch-forward)
(define-key init/search-map (kbd "b") #'isearch-backward)
(define-key init/search-map (kbd "r") #'isearch-forward-regexp)
(define-key init/search-map (kbd "R") #'isearch-backward-regexp)
(define-key init/search-map (kbd "q") #'query-replace)
(define-key init/search-map (kbd "Q") #'query-replace-regexp)
(define-key init/search-map (kbd "n") #'isearch-repeat-forward)
(define-key init/search-map (kbd "p") #'isearch-repeat-backward)

;; `repeat-mode' (enabled by init-windows) keeps this map active after either
;; navigation command, so `C-c s n n n' continues to advance through matches.
(put 'isearch-repeat-forward 'repeat-map 'init/search-map)
(put 'isearch-repeat-backward 'repeat-map 'init/search-map)

;; Isearch uses its own overriding keymap, so expose the prefix there too.
(define-key isearch-mode-map (kbd "C-c s") init/search-map)

(provide 'init-search)
;;; init-search.el ends here

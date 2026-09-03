;;; init-windows.el --- Window navigation -*- lexical-binding: t; -*-

(require 'use-package)

(use-package ace-window
  :ensure t)

(provide 'init-windows)
;;; init-windows.el ends here


(defun my/window-resize-left ()
  "Move the relevant vertical window divider left."
  (interactive)
  (if (window-in-direction 'left)
      (enlarge-window-horizontally 1)
    (shrink-window-horizontally 1)))

(defun my/window-resize-right ()
  "Move the relevant vertical window divider right."
  (interactive)
  (if (window-in-direction 'right)
      (enlarge-window-horizontally 1)
    (shrink-window-horizontally 1)))

(defun my/window-resize-down ()
  "Move the relevant horizontal window divider down."
  (interactive)
  (if (window-in-direction 'below)
      (enlarge-window 1)
    (shrink-window 1)))

(defun my/window-resize-up ()
  "Move the relevant horizontal window divider up."
  (interactive)
  (if (window-in-direction 'above)
      (enlarge-window 1)
    (shrink-window 1)))

(defvar my/window-resize-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "h") #'my/window-resize-left)
    (define-key map (kbd "j") #'my/window-resize-down)
    (define-key map (kbd "k") #'my/window-resize-up)
    (define-key map (kbd "l") #'my/window-resize-right)
    (define-key map (kbd "=") #'balance-windows)
    (define-key map (kbd "r") #'split-window-right)
    (define-key map (kbd "d") #'split-window-below)
    (define-key map (kbd "q") #'delete-window)
    (define-key map (kbd "o") #'ace-window)
    map))

(global-set-key (kbd "C-c w") my/window-resize-map)
(global-set-key (kbd "C-c o") #'ace-window)


(repeat-mode 1)

(dolist (command '(my/window-resize-left
                   my/window-resize-right
                   my/window-resize-down
                   my/window-resize-up))
  (put command 'repeat-map 'my/window-resize-map))


  (setq window-divider-default-right-width 2
        window-divider-default-bottom-width 2
        window-divider-default-places t)

  (window-divider-mode 1)


(scroll-bar-mode -1)

(add-to-list 'default-frame-alist
        '(vertical-scroll-bars . nil))
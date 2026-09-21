;;; init-windows.el --- Window navigation -*- lexical-binding: t; -*-

(require 'use-package)

(use-package ace-window
  :ensure t)

(defun my/window-resize-direction (direction amount)
  "Resize the selected window by AMOUNT toward DIRECTION.
At a frame boundary, resize using the divider on the opposite side."
  (let ((selected (selected-window)))
    (pcase direction
      ('left
       (if-let* ((neighbor (window-in-direction 'left nil t)))
           (adjust-window-trailing-edge neighbor (- amount) t)
         (if (window-in-direction 'right nil t)
             (adjust-window-trailing-edge selected (- amount) t)
           (user-error "No vertical window divider to move"))))
      ('right
       (if (window-in-direction 'right nil t)
           (adjust-window-trailing-edge selected amount t)
         (if-let* ((neighbor (window-in-direction 'left nil t)))
             (adjust-window-trailing-edge neighbor amount t)
           (user-error "No vertical window divider to move"))))
      ('up
       (if-let* ((neighbor (window-in-direction 'above nil t)))
           (adjust-window-trailing-edge neighbor (- amount))
         (if (window-in-direction 'below nil t)
             (adjust-window-trailing-edge selected (- amount))
           (user-error "No horizontal window divider to move"))))
      ('down
       (if (window-in-direction 'below nil t)
           (adjust-window-trailing-edge selected amount)
         (if-let* ((neighbor (window-in-direction 'above nil t)))
             (adjust-window-trailing-edge neighbor amount)
           (user-error "No horizontal window divider to move")))))))

(defmacro my/define-window-resize-command (name direction amount)
  "Define NAME to resize toward DIRECTION by AMOUNT."
  `(defun ,name ()
     ,(format "%s the selected window toward %s."
              (if (> amount 0) "Increase" "Decrease") direction)
     (interactive)
     (my/window-resize-direction ',direction ,amount)))

(my/define-window-resize-command my/window-resize-left left 1)
(my/define-window-resize-command my/window-resize-down down 1)
(my/define-window-resize-command my/window-resize-up up 1)
(my/define-window-resize-command my/window-resize-right right 1)
(my/define-window-resize-command my/window-resize-decrease-left left -1)
(my/define-window-resize-command my/window-resize-decrease-down down -1)
(my/define-window-resize-command my/window-resize-decrease-up up -1)
(my/define-window-resize-command my/window-resize-decrease-right right -1)

(defvar my/window-resize-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "h") #'windmove-left)
    (define-key map (kbd "j") #'windmove-down)
    (define-key map (kbd "k") #'windmove-up)
    (define-key map (kbd "l") #'windmove-right)
    (define-key map (kbd "M-h") #'my/window-resize-left)
    (define-key map (kbd "M-j") #'my/window-resize-down)
    (define-key map (kbd "M-k") #'my/window-resize-up)
    (define-key map (kbd "M-l") #'my/window-resize-right)
    (define-key map (kbd "M-H") #'my/window-resize-decrease-left)
    (define-key map (kbd "M-J") #'my/window-resize-decrease-down)
    (define-key map (kbd "M-K") #'my/window-resize-decrease-up)
    (define-key map (kbd "M-L") #'my/window-resize-decrease-right)
    (define-key map (kbd "=") #'balance-windows)
    (define-key map (kbd "r") #'split-window-right)
    (define-key map (kbd "d") #'split-window-below)
    (define-key map (kbd "q") #'delete-window)
    (define-key map (kbd "o") #'ace-window)
    map))

(global-set-key (kbd "C-c w") my/window-resize-map)
(global-set-key (kbd "C-c o") #'ace-window)

(defvar my/window-resize-repeat-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-h") #'my/window-resize-left)
    (define-key map (kbd "M-j") #'my/window-resize-down)
    (define-key map (kbd "M-k") #'my/window-resize-up)
    (define-key map (kbd "M-l") #'my/window-resize-right)
    (define-key map (kbd "M-H") #'my/window-resize-decrease-left)
    (define-key map (kbd "M-J") #'my/window-resize-decrease-down)
    (define-key map (kbd "M-K") #'my/window-resize-decrease-up)
    (define-key map (kbd "M-L") #'my/window-resize-decrease-right)
    map))

(repeat-mode 1)

(dolist (command '(my/window-resize-left
                   my/window-resize-right
                   my/window-resize-down
                   my/window-resize-up
                   my/window-resize-decrease-left
                   my/window-resize-decrease-right
                   my/window-resize-decrease-down
                   my/window-resize-decrease-up))
  (put command 'repeat-map 'my/window-resize-repeat-map))

(setq window-divider-default-right-width 2
      window-divider-default-bottom-width 1
      window-divider-default-places t)

(window-divider-mode 1)


(scroll-bar-mode -1)

(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))

(provide 'init-windows)
;;; init-windows.el ends here

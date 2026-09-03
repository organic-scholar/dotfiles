;;; init-ui.el --- Personal UI settings -*- lexical-binding: t; -*-

;; Disable the menu bar in the current frame and in future GUI frames.
;; (menu-bar-mode -1)
;; (add-to-list 'default-frame-alist '(menu-bar-lines . 0))
;; (add-to-list 'initial-frame-alist '(menu-bar-lines . 0))

;; Disable the icon toolbar in the current frame and in future GUI frames.
;; (tool-bar-mode -1)
;; (add-to-list 'default-frame-alist '(tool-bar-lines . 0))
;; (add-to-list 'initial-frame-alist '(tool-bar-lines . 0))

;; Keep buffers in sync when their files change outside Emacs.
(setq auto-revert-verbose nil
      global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

;; Suppress audible bells, including the bell from an unused Escape key.
(setq ring-bell-function #'ignore)

;; Use a vertical bar cursor instead of a block cursor.
(setq-default cursor-type 'bar)

;; Show absolute line numbers in every buffer where they are supported.
(global-display-line-numbers-mode 1)

;;; font.el --- Personal font configuration -*- lexical-binding: t; -*-

(defconst my-default-font-family "Google Sans Code NF")
(defconst my-default-font-size 11)

;; Apply the font to frames created later, including daemon/client frames.
(add-to-list 'default-frame-alist
             `(font . ,(format "%s-%d"
                              my-default-font-family
                              my-default-font-size)))

;; Add a little vertical space between lines.
(setq-default line-spacing 0.15)
(setq whitespace-line-column 120)

;; Apply it immediately when Emacs starts with a graphical frame.
(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :family my-default-font-family
                      :height (* my-default-font-size 10)))

(require 'pixel-scroll)

(setq pixel-scroll-precision-interpolation-total-time 0.10)
(pixel-scroll-precision-mode 1)

(defun my-scroll-half-page-down ()
  (interactive)
  (if (display-graphic-p)
      (pixel-scroll-precision-interpolate
       (- (/ (window-text-height nil t) 2)) nil 1)
    (scroll-up-command (/ (window-body-height) 2))))

(defun my-scroll-half-page-up ()
  (interactive)
  (if (display-graphic-p)
      (pixel-scroll-precision-interpolate
       (/ (window-text-height nil t) 2) nil 1)
    (scroll-down-command (/ (window-body-height) 2))))

(with-eval-after-load 'pixel-scroll
  (define-key pixel-scroll-precision-mode-map (kbd "<next>")
    #'my-scroll-half-page-down)
  (define-key pixel-scroll-precision-mode-map (kbd "<prior>")
    #'my-scroll-half-page-up))

(provide 'init-ui)

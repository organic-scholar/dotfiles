;; Prelude-style minibuffer completion.
(require 'use-package)

;; Preview completion-at-point candidates inline while typing.
(global-completion-preview-mode -1)

;; Cycle inline candidates with TAB and M-TAB; RET accepts the selection.
;; (keymap-set completion-preview-active-mode-map "TAB"
;;             #'completion-preview-next-candidate)
;; (keymap-set completion-preview-active-mode-map "<tab>"
;;             #'completion-preview-next-candidate)
;; (keymap-set completion-preview-active-mode-map "M-TAB"
;;             #'completion-preview-prev-candidate)
;; (keymap-set completion-preview-active-mode-map "M-<tab>"
;;             #'completion-preview-prev-candidate)
(keymap-set completion-preview-active-mode-map "<tab>"
            #'completion-preview-insert)

;; Keep focus in the source buffer while navigating a visible completion list.
(setq completion-in-region-mode-predicate
      (lambda () (derived-mode-p 'prog-mode)))
(keymap-set completion-in-region-mode-map "<tab>"
            #'minibuffer-next-completion)
(keymap-set completion-in-region-mode-map "M-<tab>"
            #'minibuffer-previous-completion)
(keymap-set completion-in-region-mode-map "RET"
            #'minibuffer-choose-completion)


(defun init-completion-bind-tab ()
  "Use TAB for completion in programming buffers."
  (keymap-local-set "C-c TAB" #'completion-at-point)
  (keymap-local-set "C-c <tab>" #'completion-at-point))

(add-hook 'prog-mode-hook #'init-completion-bind-tab)

;; Show candidates vertically and rank recently used commands first.
(use-package vertico
  :ensure t
  :init
  (require 'vertico-sort)
  (vertico-mode 1)
  :custom
  (vertico-count 10)
  (vertico-scroll-margin 2)
  (vertico-resize t)
  (vertico-cycle nil)
  (vertico-sort-function #'vertico-sort-history-length-alpha))

;; Match space-separated parts of a command in any order.
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Complete file paths at point without adding noisy word completions.
(use-package cape
  :ensure t
  :init
  (add-hook 'completion-at-point-functions #'cape-file))

;; Annotate candidates with useful context, including command documentation.
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

;; Prelude's most useful Consult bindings.
(use-package consult
  :ensure t
  :bind (("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         :map goto-map
         ("g" . consult-goto-line)
         ("o" . consult-outline)
         ("i" . consult-imenu)
         :map search-map
         ("l" . consult-line)
         ("r" . consult-ripgrep)))

;; Contextual actions for the selected minibuffer candidate.
(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)))

(use-package embark-consult
  :ensure t
  :after (embark consult))

(provide 'init-completion)

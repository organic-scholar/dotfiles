;;; init-qmk-layer-indicator.el --- Cursor shape from QMK layer -*- lexical-binding: t; -*-

(require 'use-package)
(require 'json)

(use-package websocket
  :ensure t)

(require 'websocket)

(defgroup init-qmk-layer-indicator nil
  "Show the active QMK layer using the cursor shape."
  :group 'convenience)

(defcustom init-qmk-layer-indicator-url "ws://127.0.0.1:51837"
  "WebSocket URL that publishes QMK layer messages."
  :type 'string)

(defcustom init-qmk-layer-indicator-retry-delay 3
  "Seconds to wait before reconnecting to the QMK layer WebSocket."
  :type 'number)

(defvar init-qmk-layer-indicator-websocket nil)
(defvar init-qmk-layer-indicator-retry-timer nil)
(defvar init-qmk-layer-indicator-layer nil)
(defvar init-qmk-layer-indicator-alias nil)

(defun init-qmk-layer-indicator--set-layer (layer alias)
  "Set the cursor shape associated with QMK LAYER and remember ALIAS."
  (setq init-qmk-layer-indicator-layer layer
        init-qmk-layer-indicator-alias alias)
  (pcase layer
    (0 (setq-default cursor-type 'bar))
    (1 (setq-default cursor-type 'box)))
  (force-mode-line-update t))

(defun init-qmk-layer-indicator--on-message (_websocket frame)
  "Handle a QMK layer FRAME received over WebSocket."
  (condition-case nil
      (let* ((message (json-parse-string (websocket-frame-payload frame)))
             (layer (and (hash-table-p message)
                         (gethash "layer" message)))
             (alias (and (hash-table-p message)
                         (gethash "alias" message))))
        (when 
          (and (numberp layer)
                   (= layer (truncate layer))
                   (>= layer 0)
                   (stringp alias))
          (init-qmk-layer-indicator--set-layer (truncate layer) alias)))
    (error nil)))

(defun init-qmk-layer-indicator--schedule-reconnect ()
  "Schedule a connection attempt unless one is already pending."
  (unless (timerp init-qmk-layer-indicator-retry-timer)
    (setq init-qmk-layer-indicator-retry-timer
          (run-at-time init-qmk-layer-indicator-retry-delay nil
                       #'init-qmk-layer-indicator-connect))))

(defun init-qmk-layer-indicator--on-close (websocket)
  "Reconnect after WEBSOCKET closes."
  (when (eq websocket init-qmk-layer-indicator-websocket)
    (setq init-qmk-layer-indicator-websocket nil)
    (init-qmk-layer-indicator--schedule-reconnect)))

(defun init-qmk-layer-indicator--on-error (_websocket _type _error)
  "Schedule a reconnect after a WebSocket error."
  (init-qmk-layer-indicator--schedule-reconnect))

(defun init-qmk-layer-indicator-connect ()
  "Connect to the QMK layer indicator WebSocket."
  (interactive)
  (when (timerp init-qmk-layer-indicator-retry-timer)
    (cancel-timer init-qmk-layer-indicator-retry-timer))
  (setq init-qmk-layer-indicator-retry-timer nil)
  (unless (and init-qmk-layer-indicator-websocket
               (websocket-openp init-qmk-layer-indicator-websocket))
    (condition-case nil
        (setq init-qmk-layer-indicator-websocket
              (websocket-open
               init-qmk-layer-indicator-url
               :on-message #'init-qmk-layer-indicator--on-message
               :on-close #'init-qmk-layer-indicator--on-close
               :on-error #'init-qmk-layer-indicator--on-error))
      (error
       (setq init-qmk-layer-indicator-websocket nil)
       (init-qmk-layer-indicator--schedule-reconnect)))))

(init-qmk-layer-indicator-connect)

(provide 'init-qmk-layer-indicator)
;;; init-qmk-layer-indicator.el ends here

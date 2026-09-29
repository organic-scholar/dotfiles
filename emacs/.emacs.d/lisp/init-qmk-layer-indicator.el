;;; init-qmk-layer-indicator.el --- Cursor shape from QMK layer -*- lexical-binding: t; -*-

(defgroup init-qmk-layer-indicator nil
  "Show the active QMK layer using the cursor shape."
  :group 'convenience)

(defcustom init-qmk-layer-indicator-socket
  (expand-file-name
   "qmk-layer-indicator.sock"
   (or (getenv "XDG_RUNTIME_DIR")
       (format "/run/user/%d" (user-uid))))
  "Unix-domain socket that publishes QMK layer messages."
  :type 'file)

(defcustom init-qmk-layer-indicator-retry-delay 2
  "Seconds to wait before reconnecting to the QMK layer socket."
  :type 'number)

(defvar init-qmk-layer-indicator-process nil)
(defvar init-qmk-layer-indicator-retry-timer nil)
(defvar init-qmk-layer-indicator-layer nil)

(defun init-qmk-layer-indicator--set-layer (layer)
  "Set the cursor shape associated with QMK LAYER."
  (setq init-qmk-layer-indicator-layer layer)
  (pcase layer
    (0 (setq-default cursor-type 'bar))
    (1 (setq-default cursor-type 'box)))
  (force-mode-line-update t))

(defun init-qmk-layer-indicator--filter (process output)
  "Handle QMK layer OUTPUT received by PROCESS."
  (let* ((input (concat (or (process-get process 'pending-input) "") output))
         (lines (split-string input "\n"))
         (pending (car (last lines))))
    (dolist (line (butlast lines))
      (when (string-match "\\`LAYER:\\([0-9]+\\)\r?\\'" line)
        (init-qmk-layer-indicator--set-layer
         (string-to-number (match-string 1 line)))))
    (process-put process 'pending-input pending)))

(defun init-qmk-layer-indicator--schedule-reconnect ()
  "Schedule a connection attempt unless one is already pending."
  (unless (timerp init-qmk-layer-indicator-retry-timer)
    (setq init-qmk-layer-indicator-retry-timer
          (run-at-time init-qmk-layer-indicator-retry-delay nil
                       #'init-qmk-layer-indicator-connect))))

(defun init-qmk-layer-indicator--sentinel (process _event)
  "Reconnect when the QMK socket PROCESS closes."
  (unless (process-live-p process)
    (when (eq process init-qmk-layer-indicator-process)
      (setq init-qmk-layer-indicator-process nil))
    (init-qmk-layer-indicator--schedule-reconnect)))

(defun init-qmk-layer-indicator-connect ()
  "Connect to the QMK layer indicator Unix-domain socket."
  (interactive)
  (when (timerp init-qmk-layer-indicator-retry-timer)
    (cancel-timer init-qmk-layer-indicator-retry-timer))
  (setq init-qmk-layer-indicator-retry-timer nil)
  (unless (process-live-p init-qmk-layer-indicator-process)
    (condition-case nil
        (setq init-qmk-layer-indicator-process
              (make-network-process
               :name "qmk-layer-indicator"
               :family 'local
               :service init-qmk-layer-indicator-socket
               :coding 'utf-8-unix
               :noquery t
               :filter #'init-qmk-layer-indicator--filter
               :sentinel #'init-qmk-layer-indicator--sentinel))
      (file-error
       (init-qmk-layer-indicator--schedule-reconnect)))))

(init-qmk-layer-indicator-connect)

(provide 'init-qmk-layer-indicator)
;;; init-qmk-layer-indicator.el ends here

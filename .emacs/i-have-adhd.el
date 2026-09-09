;;; i-have-adhd.el --- ADHD-friendly AI responses -*- lexical-binding: t; -*-

;; Copyright (C) 2024 ayghri
;; Author: ayghri
;; Version: 1.0.0
;; Package-Requires: ((emacs "27.1"))
;; License: MIT
;; Keywords: convenience, ai, adhd

;;; Commentary:
;; Transform AI coding assistant responses to be ADHD-friendly:
;; - Action-first responses with commands and code snippets first
;; - Numbered steps for multi-step tasks
;; - Concrete next actions doable in under 2 minutes
;; - No preamble, recaps, or closing pleasantries

;;; Code:

(defgroup i-have-adhd nil
  "ADHD-friendly AI response formatting."
  :group 'convenience
  :prefix "adhd-")

(defcustom adhd-mode-enabled nil
  "Whether ADHD-friendly mode is enabled."
  :type 'boolean
  :group 'i-have-adhd)

(defcustom adhd-show-modeline-indicator t
  "Show indicator in mode line when ADHD mode is active."
  :type 'boolean
  :group 'i-have-adhd)

(defvar adhd-rules
  "## Output style

The reader has ADHD. Shape every response so it can be acted on:

1. Lead with the answer or next action: command, path, or snippet first.
2. Number multi-step work; one bounded action per step.
3. End with one next action doable in under two minutes.
4. Finish the current issue before raising a new one.
5. Restate progress each turn (\"step 3 of 5 done\").
6. Give time estimates in concrete units, never \"a bit\".
7. After a change, show what now works.
8. Errors: state location, cause, and fix. No drama.
9. Cap lists at 5 items.
10. No preamble, no recaps, no closers."
  "The ADHD-friendly output rules.")

(defun adhd-toggle ()
  "Toggle ADHD-friendly mode."
  (interactive)
  (setq adhd-mode-enabled (not adhd-mode-enabled))
  (if adhd-mode-enabled
      (message "ADHD-friendly mode ENABLED")
    (message "ADHD-friendly mode DISABLED"))
  (when adhd-show-modeline-indicator
    (force-mode-line-update)))

(defun adhd-enable ()
  "Enable ADHD-friendly mode."
  (interactive)
  (setq adhd-mode-enabled t)
  (message "ADHD-friendly mode ENABLED"))

(defun adhd-disable ()
  "Disable ADHD-friendly mode."
  (interactive)
  (setq adhd-mode-enabled nil)
  (message "ADHD-friendly mode DISABLED"))

(defun adhd-show-rules ()
  "Display ADHD-friendly rules in a buffer."
  (interactive)
  (with-help-window "*ADHD Rules*"
    (princ adhd-rules)))

(defun adhd-copy-rules ()
  "Copy ADHD-friendly rules to kill ring."
  (interactive)
  (kill-new adhd-rules)
  (message "ADHD rules copied to kill ring"))

(defun adhd-mode-line-format ()
  "Return mode line format for ADHD mode."
  (if (and adhd-mode-enabled adhd-show-modeline-indicator)
      '(:eval (if adhd-mode-enabled " [ADHD ON]" ""))
    ""))

(add-to-list 'global-mode-string '(:eval (adhd-mode-line-format)))

;;;###autoload
(define-minor-mode adhd-global-mode
  "Global minor mode for ADHD-friendly AI responses."
  :global t
  :lighter " ADHD"
  :group 'i-have-adhd
  (if adhd-global-mode
      (progn
        (setq adhd-mode-enabled t)
        (message "ADHD-friendly mode ENABLED"))
    (setq adhd-mode-enabled nil)
    (message "ADHD-friendly mode DISABLED")))

;; Key bindings
(define-prefix-command 'adhd-map)
(global-set-key (kbd "C-c a") 'adhd-map)
(define-key adhd-map (kbd "t") #'adhd-toggle)
(define-key adhd-map (kbd "e") #'adhd-enable)
(define-key adhd-map (kbd "d") #'adhd-disable)
(define-key adhd-map (kbd "r") #'adhd-show-rules)
(define-key adhd-map (kbd "c") #'adhd-copy-rules)

(provide 'i-have-adhd)

;;; i-have-adhd.el ends here

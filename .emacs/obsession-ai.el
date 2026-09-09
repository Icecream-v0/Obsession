;;; obsession-ai.el --- ADHD-friendly AI responses -*- lexical-binding: t; -*-

;; Copyright (C) 2024 ayghri
;; Author: ayghri
;; Version: 1.0.0
;; Package-Requires: ((emacs "27.1"))
;; License: MIT
;; Keywords: convenience, ai, obsession

;;; Commentary:
;; Transform AI coding assistant responses to be ADHD-friendly:
;; - Action-first responses with commands and code snippets first
;; - Numbered steps for multi-step tasks
;; - Concrete next actions doable in under 2 minutes
;; - No preamble, recaps, or closing pleasantries

;;; Code:

(defgroup obsession-ai nil
  "ADHD-friendly AI response formatting."
  :group 'convenience
  :prefix "obsession-")

(defcustom obsession-mode-enabled nil
  "Whether ADHD-friendly mode is enabled."
  :type 'boolean
  :group 'obsession-ai)

(defcustom obsession-show-modeline-indicator t
  "Show indicator in mode line when ADHD mode is active."
  :type 'boolean
  :group 'obsession-ai)

(defvar obsession-rules
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

(defun obsession-toggle ()
  "Toggle ADHD-friendly mode."
  (interactive)
  (setq obsession-mode-enabled (not obsession-mode-enabled))
  (if obsession-mode-enabled
      (message "ADHD-friendly mode ENABLED")
    (message "ADHD-friendly mode DISABLED"))
  (when obsession-show-modeline-indicator
    (force-mode-line-update)))

(defun obsession-enable ()
  "Enable ADHD-friendly mode."
  (interactive)
  (setq obsession-mode-enabled t)
  (message "ADHD-friendly mode ENABLED"))

(defun obsession-disable ()
  "Disable ADHD-friendly mode."
  (interactive)
  (setq obsession-mode-enabled nil)
  (message "ADHD-friendly mode DISABLED"))

(defun obsession-show-rules ()
  "Display ADHD-friendly rules in a buffer."
  (interactive)
  (with-help-window "*ADHD Rules*"
    (princ obsession-rules)))

(defun obsession-copy-rules ()
  "Copy ADHD-friendly rules to kill ring."
  (interactive)
  (kill-new obsession-rules)
  (message "ADHD rules copied to kill ring"))

(defun obsession-mode-line-format ()
  "Return mode line format for ADHD mode."
  (if (and obsession-mode-enabled obsession-show-modeline-indicator)
      '(:eval (if obsession-mode-enabled " [ADHD ON]" ""))
    ""))

(add-to-list 'global-mode-string '(:eval (obsession-mode-line-format)))

;;;###autoload
(define-minor-mode obsession-global-mode
  "Global minor mode for ADHD-friendly AI responses."
  :global t
  :lighter " ADHD"
  :group 'obsession-ai
  (if obsession-global-mode
      (progn
        (setq obsession-mode-enabled t)
        (message "ADHD-friendly mode ENABLED"))
    (setq obsession-mode-enabled nil)
    (message "ADHD-friendly mode DISABLED")))

;; Key bindings
(define-prefix-command 'obsession-map)
(global-set-key (kbd "C-c a") 'obsession-map)
(define-key obsession-map (kbd "t") #'obsession-toggle)
(define-key obsession-map (kbd "e") #'obsession-enable)
(define-key obsession-map (kbd "d") #'obsession-disable)
(define-key obsession-map (kbd "r") #'obsession-show-rules)
(define-key obsession-map (kbd "c") #'obsession-copy-rules)

(provide 'obsession-ai)

;;; obsession-ai.el ends here

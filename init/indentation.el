;;; indentation.el --- Indentation settings across various modes.

;;; Commentary:

;; Indentation settings for all modes.  I tend to use 2 space indentation everywhere.

;;; Code:

(require 'css-mode)
(require 'js2-mode)
(require 'ruby-mode)
(require 'web-mode)

(setq-default tab-width 2)
(set-default 'indent-tabs-mode nil)
(global-font-lock-mode 1)
(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq css-indent-offset 2)
(setq sgml-basic-offset 2)
(setq ruby-indent-level 2)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren-style nil)

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode.  Adjust indentation."
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Fix closing paren indentation. Stolen from https://gist.github.com/1274520
;; TODO: still needed?
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;;; indentation.el ends here

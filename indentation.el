(setq-default tab-width 2)
(set-default 'indent-tabs-mode nil)
(global-font-lock-mode 1)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq sgml-basic-offset 2)
(setq ruby-indent-level 2)
(setq ruby-deep-arglist nil)
(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren-style nil)

(custom-set-variables
 '(js2-basic-offset 2))

;; Fix closing paren indentation. Stolen from https://gist.github.com/1274520
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

; todo: do I need this anymore?
;(defun local-sgml-mode-hook
;  (setq fill-column 70
;        indent-tabs-mode nil
;        next-line-add-newlines nil
;        standard-indent 2
;        sgml-indent-data t)
;  (auto-fill-mode t)
;  (setq sgml-catalog-files '("/usr/local/share/sgml/catalog")))
;(add-hook 'psgml-mode-hook
;          '(lambda () (local-psgml-mode-hook)))
;(add-hook 'html-mode-hook (lambda () (set (make-local-variable 'sgml-basic-offset) 2)))


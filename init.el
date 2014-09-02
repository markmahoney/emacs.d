;; Turn off mouse interface
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path "~/.emacs.d")

(load "package-installation")

(ensure-package-installed 
 'paredit
 'flymake-easy
 'flymake-ruby
 'web-mode
 'js2-mode
 'less-css-mode
 'scala-mode2)

;; Disable backup
(setq make-backup-files nil)
(setq backup-inhibited t)

;; Disable auto save
(setq auto-save-default nil)

;; Disable encoding magic comment
(add-hook 'ruby-mode-hook (lambda () (setq ruby-insert-encoding-magic-comment nil)))

;; Truncate long lines
(setq-default truncate-lines t)

;; No splash screen
(setq inhibit-startup-message t)

;; Remove extra bells and whistles
(setq ring-bell-function (lambda nil (message "")))
(setq visible-bell nil)

; colors
;(require 'color-theme)
;(setq color-theme-is-global t)
;(color-theme-goldenrod)

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))

(load "modes")
(load "key-bindings")
(load "indentation")

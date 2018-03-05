
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "/Users/markmahoney/.emacs.d/init")

(load "package-installation")

(ensure-package-installed 
 'color-theme-modern
 'paredit
 'flymake-easy
 'flymake-ruby
 'web-mode
 'js2-mode
 'less-css-mode
 'scala-mode)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

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
(load-theme 'goldenrod t)

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))

(load "modes")
(load "key-bindings")
(load "indentation")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-basic-offset 2)
 '(package-selected-packages
   (quote
    (scala-mode yaml-mode web-mode scala-mode2 paredit less-css-mode js2-mode flymake-ruby erlang color-theme-modern clojure-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

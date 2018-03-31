;;; environment.el --- Emacs environment configuration.

;;; Commentary:

;; Emacs environment configuration, for things like disabling menus and splash screens.

;;; Code:

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Clean up the view
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Disable backup
(setq make-backup-files nil)
(setq backup-inhibited t)

;; Disable auto save
(setq auto-save-default nil)

;; Truncate long lines
(setq-default truncate-lines t)

;; No splash screen
(setq inhibit-startup-message t)

;; Remove extra bells and whistles
(setq ring-bell-function (lambda nil (message "")))
(setq visible-bell nil)

;; Set up the color theme
(load-theme 'goldenrod t)

;;; environment.el ends here

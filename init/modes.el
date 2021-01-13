;;; modes.el --- Emacs mode configuration

;;; Commentary:

;; This file is largely dominated by modern JS environment configs.  JS mode-related stuff probably needs its own file at some point.

;;; Code:

(require 'add-node-modules-path)
(require 'flycheck)
(require 'flycheck-flow)
(require 'prettier-js)
(require 'rjsx-mode)
(require 'use-package)
(require 'web-mode)

(use-package dumb-jump
  :bind (("M-n o" . dumb-jump-go)
         ("M-n i" . dumb-jump-quick-look)
         ("M-n b" . dumb-jump-back)
         ("M-n p" . dumb-jump-go-prompt))
  :config (setq dumb-jump-selector 'ivy)
  :ensure)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . rjsx-mode))
(setq auto-mode-alist (cons '("\\.json$" . json-mode) auto-mode-alist))
(add-to-list 'interpreter-mode-alist '("node" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; Add flycheck modes to rjsx-mode
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(flycheck-add-mode 'javascript-flow 'rjsx-mode)
(flycheck-add-next-checker 'javascript-flow 'javascript-eslint)
(setq flycheck-javascript-flow-args nil)

;; Ensure rjsx's underlying js2 mode isn't trying to lint, too
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
      
;; Disable unneeded flycheck modes
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
          '(javascript-jshint javascript-standard json-jsonlist)))

;; Ensure usage of local node module configs first
(add-hook 'flycheck-mode-hook #'add-node-modules-path)
(eval-after-load 'rjsx-mode
    '(progn
       (add-hook 'rjsx-mode-hook #'add-node-modules-path)
       ;; enable prettier file rewrites on save
       (add-hook 'rjsx-mode-hook #'prettier-js-mode)))

;; prettier-js config (there has to be a better way to do this)
(setq prettier-js-args '(
  "--single-quote" "--trailing-comma" "all" "--no-semi"))

;; glsl mode
(autoload 'glsl-mode "glsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.geom\\'" . glsl-mode))

;;; modes.el ends here

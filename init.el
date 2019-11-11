;;; init.el --- My Emacs init file

;;; Commentary:

;; see README.md

;;; Code:

(add-to-list 'load-path "~/.emacs.d/init")

(require 'package-installation)

(ensure-package-installed
 'add-node-modules-path
 'clojure-mode
 'color-theme-modern
 'css-mode
 'dumb-jump
 'erlang
 'exec-path-from-shell
 'flycheck
 'flycheck-flow
 'js2-mode
 'json-mode
 'magit
 'markdown-mode
 'rjsx-mode
 'ruby-mode
 'paredit
 'prettier-js
 'scala-mode
 'use-package
 'web-mode
 'yaml-mode)

(load "environment")
(load "key-bindings")
(load "modes")
(load "indentation")
(load "custom")

(provide 'init)
;;; init.el ends here

;;; key-bindings.el --- Key bindings

;;; Commentary:

;; Custom key bindings.

;;; Code:

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-c m") 'pop-global-mark)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

(global-set-key (kbd "M-s") 'isearch-forward-regexp)
(global-set-key (kbd "M-r") 'isearch-backward-regexp)

(global-set-key (kbd "C-z") 'other-window)
(global-set-key (kbd "M-z") 'next-buffer)

(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)
(global-set-key (kbd "C-c i") 'indent-region)

(global-set-key (kbd "M-m") 'bookmark-set)
(global-set-key (kbd "M-j") 'bookmark-jump)

(global-set-key (kbd "C-x g") 'magit-status)

;;; key-bindings.el ends here

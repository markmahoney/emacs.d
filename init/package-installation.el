;;; package-installation.el --- Ensure packages are installed on a particular machine.

;;; Commentary:

;; Utility for installing melpa packages on initialization if they are not already on this machine.

;;; Code:

(require 'package)

;; Stop package.el from writing that goddamn preamble to the top of my init file
(setq package--init-file-ensured t)

;; Move the custom-set-variable stuff to its own file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(add-to-list 'package-archives
	     '("melpa-stable" . "https://melpa.org/packages/") t)

(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assures PACKAGES are installed, prompting for installation if not.
Return a list of installed packages or nil for every package not installed."
  (mapcar
   (lambda (package)
     (package-installed-p 'evil)
     (if (package-installed-p package)
         package
       (if (y-or-n-p (format "Package %s is missing.  Install it? " package))
           (progn
             ;; Make sure we have the latest package contents.
             (package-refresh-contents)
             (package-install package))
         nil)))
   packages))

(provide 'package-installation)
;;; package-installation.el ends here

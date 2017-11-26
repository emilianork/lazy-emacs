(require 'server)

(defun lazy-emacs/server-start ()
  "Starts a new server only if there is no other already"

  (if (and (fboundp 'server-running-p)
	   (not (server-running-p)))
      (server-start)))

(defun lazy-emacs/load-theme (theme-name
			      &optional theme-dir
			      &optional additional-lib)
  "If the theme is the only one in the same package, then
the conventions is:  \"~/.emacs.d/themes/THEME-NAME/THEME-NAME-theme.el\". But
if it happens to be one of various themes, then the convections is:
\"~/.emacs.d/themes/THEME-DIR/THEME-NAME-theme.el\".

ADDITIONAL-LIB must be in the same directory."

  (let ((s-theme-name (symbol-name theme-name)))
    (let ((file-name (concat "~/.emacs.d/themes/"
                            (if theme-dir theme-dir s-theme-name)
			    "/"
			    s-theme-name
			    "-theme.el")))

      (let ((file-path (file-name-directory file-name)))
	(if (and (file-exists-p file-name)
		 (not (featurep (intern (concat s-theme-name "-theme")))))
	    (add-to-list 'custom-theme-load-path file-path))

	(if additional-lib
	    (let ((additional-lib-file-name
		   (concat file-path (symbol-name additional-lib))))
	      (lazy-emacs/require additional-lib additional-lib-file-name))))

      (load-theme theme-name t))))

(defun lazy-emacs/reload-init ()
  "Reloads the ~/.emacs.d/init.el"
  (interactive)
  (byte-recompile-directory (expand-file-name "~/.emacs.d/") 0)
  (load "~/.emacs.d/init.el"))

(defun lazy-emacs/startup-profiler ()
  (lazy-emacs/require-package 'esup)
  (interactive)
  (esup))

(defun lazy-emacs/require-package (package-name &optional special-dir &rest rest-packages)
  "PACKAGE-NAME is the name of the directory and the main package.
Sometimes this folder contains more packages to be load, REST-PACKAGES
load the rest of the packages that contains PACKAGE-NAME."
  (let ((path (concat "~/.emacs.d/packages/" (symbol-name package-name)
		      (if (stringp special-dir) (concat "/" special-dir) ""))))

    (add-to-list 'load-path path))

  (require package-name)
  ;; special-dir is part of rest-packages
  (if (and special-dir (not (stringp special-dir))) (require special-dir))

  (mapcar (lambda (x) (require x))
	  rest-packages))

(defun lazy-emacs/load-file (feature file-name)
  "Checks if the FEATURE was already loaded, in case that it's new
then is loaded from FILE-NAME."
  (if (not (featurep feature))
      (load file-name)))

(defun lazy-emacs/require (feature file-path)
  "Loads the FEATURE from the FILE-PATH and then requires it."
  (lazy-emacs/load-file feature file-path)
  (require feature))

(defun lazy-emacs/require-layer (layer-name)
  "Loads the corresponding LAYER-NAME, remmenber that inside the
layer, everything is especfied to be laziness loaded."
  (let ((s-layer-name (symbol-name layer-name)))
    (lazy-emacs/require
     layer-name
     (concat "~/.emacs.d/layers/" s-layer-name "/" s-layer-name))))

(provide 'core-helpers)

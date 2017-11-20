(require 'server)

(defun lazy-emacs/server-start ()
  "Starts a new server only if there is no other already"

  (if (and (fboundp 'server-running-p) 
	   (not (server-running-p)))
      (server-start)))

(defun lazy-emacs/load-theme (theme-name &rest theme-dir)
  "If the theme is the only one in the same package, then
   the conventions is:  \"~/.emacs.d/themes/cyberpunk/cyberpunk-theme.el\". But
   if it happens to be one of various themes, then the convections is:
   \"~/.emacs.d/themes/spacemacs/spacemacs-light-theme.el\"."

  (let ((s-theme-name (symbol-name theme-name))
	(s-theme-dir (mapconcat 'identity theme-dir "")))
    (let ((filename (concat "~/.emacs.d/themes/"
                            (if (eq 0 (length s-theme-dir))
				s-theme-name
			      s-theme-dir)
			    "/"
			    s-theme-name
			    "-theme.el")))

      (if (and (file-exists-p filename)
               (not (featurep (intern (concat s-theme-name "-theme")))))
          (add-to-list 'custom-theme-load-path (file-name-directory filename)))

      (load-theme theme-name t))))

(defun lazy-emacs/reload-init ()
  (interactive)
  (load "~/.emacs.d/init.el"))

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "M-n e r i") 'lazy-emacs/reload-init)))

(provide 'core-helpers)


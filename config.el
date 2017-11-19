(defun lazy-emacs/load-theme (theme-name &rest theme-dir)
  (let ((s-theme-name (symbol-name theme-name))
	(s-theme-dir (mapconcat 'identity theme-dir "")))
    (let ((filename (concat "~/.emacs.d/themes/"
                            (if (eq 0 (length s-theme-dir))
				(concat theme-name "-theme")
			      s-theme-dir)
			    "/"
			    s-theme-name
			    ".el")))

      (if (file-exists-p filename)
	  (load filename)
	(load-theme theme-name t)))))

(defun lazy-emacs/load-config ()

  ;;Scroll only only at a time.
  (setq scroll-step 1)

  ;; don't accelerate scrolling
  (setq mouse-wheel-progressive-speed nil)

  ;; scroll window under mouse
  (setq mouse-wheel-follow-mouse 't)

  ;;don't create *~ files
  (setq make-backup-files nil)

  ;; Indentation
  (setq-default ndent-tabs-mode nil)

  ;;No save file like #..
  (setq make-backup-files nil)

  (put 'downcase-region 'disabled nil)
  (setq-default indent-tabs-mode nil)

  (setq ispell-dictionary "castellano")

  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease))

(provide 'config)

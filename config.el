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

  ;;No Splash
  (setq inhibit-splash-screen t)
  (setq inhibit-startup-message t)

  ;; Initial major mode
  (setq initial-major-mode 'text-mode)

  ;;No icons no scroll-bar
  (tool-bar-mode -1)
  (toggle-scroll-bar -1)

  (put 'downcase-region 'disabled nil)
  (setq-default indent-tabs-mode nil)

  (setq ispell-dictionary "castellano")

  (setq column-number-mode t)

  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease))

(provide 'config)

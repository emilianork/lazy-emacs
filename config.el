(defun lazy-emacs/load-config ()
  ;; Cursor customization
  (global-hl-line-mode t)
  (setq-default cursor-type 'hbar)

  ;;Scroll only only at a time.
  (setq scroll-step 1)

  ;; Font size of 12pts
  (set-face-attribute 'default nil :height 110)

  ;; don't accelerate scrolling
  (setq mouse-wheel-progressive-speed nil)

  ;; scroll window under mouse
  (setq mouse-wheel-follow-mouse 't)

  ;;don't create *~ files
  (setq make-backup-files nil)

  ;; Indentation
  (setq-default ndent-tabs-mode nil)

  ;; No save file like #..
  (setq make-backup-files nil)

  ;;No Splash
  (setq inhibit-splash-screen t)
  (setq inhibit-startup-message t)

  ;; Initial major mode
  (setq initial-major-mode 'text-mode)

  ;; No icons no scroll-bar
  (tool-bar-mode -1)
  (toggle-scroll-bar -1)

  ;; Right metadata recerved for Mac
  (setq mac-option-key-is-meta t)
  (setq mac-right-option-modifier nil)

  (put 'downcase-region 'disabled nil)
  (setq-default indent-tabs-mode nil)

  (setq ispell-dictionary "castellano")

  ;; Shows number column
  (setq column-number-mode t)

  ;; Internal border
  (setq internal-border-width 10)

  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)

  (setq-default show-trailing-whitespace t)

  (lazy-emacs/diminish-minor-modes))

(provide 'config)

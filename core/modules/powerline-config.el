(lazy-emacs/require-package 'powerline)
(lazy-emacs/require-package 'nyan-mode)

;;(nyan-mode)
;;(nyan-start-animation)

;; "Custom lazy-emacs theme"

(defcustom powerline-display-buffer-size t
  "When non-nil, display the buffer size."
  :group 'powerline
  :type 'boolean)

(defcustom powerline-display-mule-info t
  "When non-nil, display the mule info."
  :group 'powerline
  :type 'boolean)

(defcustom powerline-display-hud t
  "When non-nil, display the hud."
  :group 'powerline
  :type 'boolean)

(custom-set-variables
 '(powerline-gui-use-vcs-glyph t)
 '(powerline-height 25)
 '(powerline-default-separator 'bar))

;; (custom-set-faces
;;  '(powerline-active1 ((t (:inherit mode-line :background "grey17" :foreground "white" :inherit mode-line))))
;;  '(powerline-active2 ((t (:inherit mode-line :background "grey17" :foreground "white" :inherit mode-line))))
;;  '(powerline-inactive0 ((t (:inherit mode-line-inactive :background "grey17"))))
;;  '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "grey17"))))
;;  '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "grey17"))))
;;  )

(custom-set-faces
 '(powerline-active1 ((t (:inherit mode-line :background "grey" :foreground "white" :inherit mode-line))))
 '(powerline-active2 ((t (:inherit mode-line :background "grey" :foreground "white" :inherit mode-line))))
 '(powerline-inactive0 ((t (:inherit mode-line-inactive :background "grey" :foreground "white"))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "grey" :foreground "white"))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "grey" :foreground "white"))))
 )

(defun powerline-lazy-emacs-theme ()
  "Setup the lazy-emacs mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face0 (if active 'powerline-active0 'powerline-inactive0))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" face0 'l)
                                     (when powerline-display-buffer-size
                                       (powerline-buffer-size face0 'l))
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info face0 'l))
                                     (powerline-buffer-id `(mode-line-buffer-id ,face0) 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format face0 'l))
                                     (powerline-raw " " face0)
                                     (funcall separator-left face0 face1)
                                     (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     ;; I just need to see the major mode
                                     ;; (powerline-minor-modes face1 'l)
                                     ;;
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) face2 'l))))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
				     (unless window-system
				       (powerline-raw (char-to-string #xe0a1) face1 'l))
				     (powerline-raw "%4l" face1 'l)
				     (powerline-raw ":" face1 'l)
				     (powerline-raw "%3c" face1 'r)
				     (funcall separator-right face1 face0)
				     (powerline-raw " " face0)
				     (powerline-raw "%6p" face0 'r)
                                     (when powerline-display-hud
                                       (powerline-hud face0 face2))
				     (powerline-fill face0 0)
				     )))
		     (concat (powerline-render lhs)
			     (powerline-fill face2 (powerline-width rhs))
			     (powerline-render rhs)))))))

(powerline-lazy-emacs-theme)

(provide 'powerline-config)

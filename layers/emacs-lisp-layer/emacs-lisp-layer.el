(defun lazy-emacs/elisp-minor-modes ()
  (lazy-emacs/require-package 'aggressive-indent)
  (lazy-emacs/require-package 'company 'company-elisp)
  (lazy-emacs/require-package 'editorconfig)
  (lazy-emacs/require-package 'paredit)
  (lazy-emacs/require-package 'rainbow-delimiters)

  (lazy-emacs/load-magit)
  (lazy-emacs/load-dumb-jump)

  (lazy-emacs/diminish-minor-modes)

  (aggressive-indent-mode t)
  (company-mode t)
  (dumb-jump-mode t)
  (editorconfig-mode t)
  (paredit-mode t)
  (rainbow-delimiters-mode t)
  (show-paren-mode t))

(defun lazy-emacs/elisp-mode-keys ()
  "Special keys for emacs-lisp-mode"
  (interactive)
  (local-set-key (kbd "M-n e r i") 'lazy-emacs/reload-init)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-hook 'emacs-lisp-mode-hook 'lazy-emacs/elisp-minor-modes)
(add-hook 'emacs-lisp-mode-hook 'lazy-emacs/elisp-mode-keys)

(provide 'emacs-lisp-layer)

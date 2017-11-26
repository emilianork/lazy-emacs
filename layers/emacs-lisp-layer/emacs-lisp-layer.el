(defun lazy-emacs/elisp-minor-modes ()
  (lazy-emacs/require-package 'editorconfig)
  (lazy-emacs/require-package 'paredit)
  (lazy-emacs/require-package 'rainbow-delimiters)
  (lazy-emacs/require-package 'company 'company-elisp)

  (lazy-emacs/load-magit)

  (paredit-mode t)
  (rainbow-delimiters-mode t)
  (company-mode t)
  (show-paren-mode t)
  (editorconfig-mode t))

(defun lazy-emacs/elisp-mode-keys ()
  "Special keys for emacs-lisp-mode"
  (interactive)
  (local-set-key (kbd "M-n e r i") 'lazy-emacs/reload-init)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-hook 'emacs-lisp-mode-hook 'lazy-emacs/elisp-minor-modes)
(add-hook 'emacs-lisp-mode-hook 'lazy-emacs/elisp-mode-keys)

(provide 'emacs-lisp-layer)

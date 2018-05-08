(defun lazy-emacs/python-minor-modes ()
  (lazy-emacs/require-package 'company)
  (lazy-emacs/require-package 'editorconfig)

  (lazy-emacs/load-magit)
  (lazy-emacs/load-dumb-jump)

  (lazy-emacs/diminish-minor-modes)

  (company-mode t)
  (dumb-jump-mode t)
  (editorconfig-mode t)
  (show-paren-mode t))

(defun lazy-emacs/python-mode-keys ()
  (interactive)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-hook 'python-mode-hook 'lazy-emacs/python-minor-modes)
(add-hook 'python-mode-hook 'lazy-emacs/python-mode-keys)

(provide 'python-layer)

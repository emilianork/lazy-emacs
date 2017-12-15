(defun lazy-emacs/ruby-minor-modes ()
  (lazy-emacs/require-package 'aggressive-indent)
  (lazy-emacs/require-package 'company)
  (lazy-emacs/require-package 'editorconfig)

  (lazy-emacs/load-magit)
  (lazy-emacs/load-dumb-jump)

  (aggressive-indent-mode t)
  (company-mode t)
  (dumb-jump-mode t)
  (editorconfig-mode t)
  (show-paren-mode t))

(defun lazy-emacs/ruby-mode-keys ()
  (interactive)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-hook 'ruby-mode-hook 'lazy-emacs/ruby-minor-modes)
(add-hook 'ruby-mode-hook 'lazy-emacs/ruby-mode-keys)

(provide 'ruby-layer)

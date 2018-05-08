(defun lazy-emacs/dired-minor-modes ()
  (lazy-emacs/load-magit)

  (lazy-emacs/diminish-minor-modes))

(defun lazy-emacs/dired-mode-keys ()
  (interactive)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-hook 'dired-mode-hook 'lazy-emacs/dired-minor-modes)
(add-hook 'dired-mode-hook 'lazy-emacs/dired-mode-keys)

(provide 'dired-layer)

(defun lazy-emacs/magit-commit-mode-load ()
  (if (not (featurep 'magit))
      (lazy-emacs/load-magit))
  (global-git-commit-mode t))

(defun lazy-emacs/magit-rebase-mode-load ()
  (if (not (featurep 'magit))
      (lazy-emacs/load-magit))
  (git-rebase-mode))

(add-to-list 'auto-mode-alist '("\\COMMIT_EDITMSG\\'" . lazy-emacs/magit-commit-mode-load))
(add-to-list 'auto-mode-alist '("\\git-rebase-todo\\'" . lazy-emacs/magit-rebase-mode-load))

(provide 'magit-config)

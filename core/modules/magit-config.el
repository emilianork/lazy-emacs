(defun lazy-emacs/magit-commit-mode-load () 
  (if (not (featurep 'magit))
      (lazy-emacs/load-magit))
  (global-git-commit-mode t))

(add-to-list 'auto-mode-alist '("\\COMMIT_EDITMSG\\'" . lazy-emacs/magit-commit-mode-load))

(provide 'magit-config)

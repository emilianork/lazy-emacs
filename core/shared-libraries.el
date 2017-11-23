(defun lazy-emacs/load-magit ()
  (lazy-emacs/require-package 'async)
  (lazy-emacs/require-package 'dash)
  (lazy-emacs/require-package 'with-editor)
  (lazy-emacs/require-package 'magit-popup)
  
  (lazy-emacs/load-file 'git-commit "~/.emacs.d/packages/magit/lisp/git-commit")

  (lazy-emacs/require-package 'magit "lisp"))

(provide 'shared-libraries)

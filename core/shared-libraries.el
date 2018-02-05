(defun lazy-emacs/load-magit ()
  (interactive)
  (lazy-emacs/require-package 'async)
  (lazy-emacs/require-package 'dash)
  (lazy-emacs/require-package 'with-editor)
  (lazy-emacs/require-package 'magit-popup)

  (lazy-emacs/require-package 'fringe-helper)
  (lazy-emacs/require-package 'git-gutter)
  (lazy-emacs/require-package 'git-gutter-fringe)

  (git-gutter-mode t)

  (lazy-emacs/load-file 'git-commit "~/.emacs.d/packages/magit/lisp/git-commit")

  (lazy-emacs/require-package 'magit "lisp"))

(defun lazy-emacs/load-cider ()
  (interactive)
  (if (not (featurep 'clojure-mode))
      (progn
        (lazy-emacs/require-package 'clojure-mode)))

  (lazy-emacs/require-package 'epl)
  (lazy-emacs/require-package 'pkg-info)
  (lazy-emacs/require-package 'spinner)
  (lazy-emacs/require-package 'queue)
  (lazy-emacs/require-package 'seq)

  (lazy-emacs/require-package 'cider)

  (add-hook 'cider-repl-mode-hook 'paredit-mode))

(defun lazy-emacs/load-dumb-jump ()
  (interactive)
  (lazy-emacs/require-package 'dash)
  (lazy-emacs/require-package 's)
  (lazy-emacs/require-package 'f)
  (lazy-emacs/require-package 'popup)

  (lazy-emacs/require-package 'dumb-jump))

(provide 'shared-libraries)

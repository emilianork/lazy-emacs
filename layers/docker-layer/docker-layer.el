(defun lazy-emacs/docker-mode-load ()
  (if (not (featurep 'dockerfile-mode))
      (progn

        (lazy-emacs/require-package 's)
        (lazy-emacs/require-package 'dockerfile-mode)))

  (lazy-emacs/diminish-minor-modes)
  (dockerfile-mode))

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . lazy-emacs/docker-mode-load))

(provide 'docker-layer)

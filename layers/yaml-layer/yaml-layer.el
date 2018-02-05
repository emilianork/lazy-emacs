(defun lazy-emacs/yaml-mode-load ()
  (if (not (featurep 'yaml-mode))
      (progn
        (lazy-emacs/require-package 'yaml-mode)))

  (lazy-emacs/load-magit)
  (yaml-mode)

  (lazy-emacs/yaml-mode-keys))

(defun lazy-emacs/yaml-mode-keys ()
  (interactive)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . lazy-emacs/yaml-mode-load))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . lazy-emacs/yaml-mode-load))

(provide 'yaml-layer)

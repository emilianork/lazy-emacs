(defun lazy-emacs/yaml-mode-load ()
  (if (not (featurep 'yaml-mode))
      (progn

        (lazy-emacs/require-package 'yaml-mode)))

  (yaml-mode))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . lazy-emacs/yaml-mode-load))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . lazy-emacs/yaml-mode-load))

(provide 'yaml-layer)

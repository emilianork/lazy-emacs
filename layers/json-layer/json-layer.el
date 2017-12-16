(defun lazy-emacs/json-mode-load ()
  (if (not (featurep 'json-mode))
      (progn
        (lazy-emacs/require-package 'json-reformat)
        (lazy-emacs/require-package 'json-snatcher)
        (lazy-emacs/require-package 'json-mode)
        (json-mode)))

  (lazy-emacs/require-package 'aggressive-indent)
  (lazy-emacs/require-package 'company)
  (lazy-emacs/require-package 'editorconfig)
  (lazy-emacs/require-package 'rainbow-delimiters)

  (lazy-emacs/load-magit)

  (aggressive-indent-mode t)
  (company-mode t)
  (editorconfig-mode t)
  (rainbow-delimiters-mode t)
  (show-paren-mode t)

  (lazy-emacs/json-mode-keys))

(defun lazy-emacs/json-mode-keys ()
  (interactive)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-to-list 'auto-mode-alist '("\\.json\\'" . lazy-emacs/json-mode-load))
(add-to-list 'auto-mode-alist '("\\.jsonld\\'" . lazy-emacs/json-mode-load))

(provide 'json-layer)

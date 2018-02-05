(defun lazy-emacs/terraform-mode-load ()
  (if (not (featurep 'terraform-mode))
      (progn
        (lazy-emacs/require-package 'hcl-mode)
        (lazy-emacs/require-package 'terraform-mode)

        (add-hook 'terraform-mode-hook 'lazy-emacs/terraform-mode-load)
        (terraform-mode)))

  (lazy-emacs/require-package 'company)
  (lazy-emacs/require-package 'company-terraform)
  (lazy-emacs/require-package 'rainbow-delimiters)

  (lazy-emacs/load-magit)

  (company-mode t)
  (rainbow-delimiters-mode t)
  (show-paren-mode t)
  (lazy-emacs/terraform-mode-keys))

(defun lazy-emacs/terraform-mode-keys ()
  (interactive)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-to-list 'auto-mode-alist '("\\.tf\\'" . lazy-emacs/terraform-mode-load))

(provide 'terraform-layer)

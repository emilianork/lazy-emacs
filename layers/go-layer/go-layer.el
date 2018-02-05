(defun lazy-emacs/go-mode-load ()
  (if (not (featurep 'go-mode))
      (progn
        (lazy-emacs/require-package 'go-mode)

        (add-hook 'go-mode-hook 'lazy-emacs/go-mode-load)
        (go-mode)))

  (lazy-emacs/require-package 'aggressive-indent)
  (lazy-emacs/require-package 'company)
  (lazy-emacs/require-package 'company-go "emacs-company")
  (lazy-emacs/require-package 'editorconfig)
  (lazy-emacs/require-package 'rainbow-delimiters)

  (lazy-emacs/load-magit)
  (lazy-emacs/load-dumb-jump)

  (aggressive-indent-mode t)
  (company-mode t)
  (dumb-jump-mode t)
  (editorconfig-mode t)
  (rainbow-delimiters-mode t)
  (show-paren-mode t)

  (lazy-emacs/go-mode-keys))

(defun lazy-emacs/go-mode-keys ()
  (interactive)
  (local-set-key (kbd "M-n g s") 'magit-status))

(add-to-list 'auto-mode-alist '("\\.go\\'" . lazy-emacs/go-mode-load))
;; boot build scripts are Clojure source files

(provide 'go-layer)

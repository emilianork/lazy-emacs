(defun lazy-emacs/markdown-mode-load ()
  (if (not (featurep 'markdown-mode))
      (progn

        (lazy-emacs/require-package 'markdown-mode)))

  (markdown-mode))

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . lazy-emacs/markdown-mode-load))
(add-to-list 'auto-mode-alist '("\\.md\\'" . lazy-emacs/markdown-mode-load))

(provide 'markdown-layer)

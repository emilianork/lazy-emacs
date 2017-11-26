(when (memq window-system '(mac ns x))

  (lazy-emacs/require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(provide 'exec-path-from-shell-config)

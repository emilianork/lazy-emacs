(defun lazy-emacs/vlf (file)
  (lazy-emacs/require-package 'vlf 'vlf-setup)
  (interactive "fFile to open: ")
  (vlf file))

(provide 'vlf-config)

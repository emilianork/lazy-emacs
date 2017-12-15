(defun lazy-emacs/revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun lazy-emacs/rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun lazy-emacs/indent-whole-buffer ()
  "Indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun lazy-emacs/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (set-difference (buffer-list)
                        (cons (current-buffer)
                              (mapcar (lambda (x) (process-buffer x)) (process-list))))))

(global-set-key (kbd "M-n b r") 'lazy-emacs/revert-buffer-no-confirm)
(global-set-key (kbd "M-n b i") 'lazy-emacs/indent-whole-buffer)
(global-set-key (kbd "M-n b k") 'lazy-emacs/kill-other-buffers)


(provide 'custom-functions)

(lazy-emacs/require-package 'multi-term)

;; This code was copy paste from the internet long time ago
;; but I don't remember from who (sorry for the credits).
(defun lazy-emacs/multi-term-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The shell is renamed to match that
directory to make multiple shell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (multi-term)
    (rename-buffer (concat "*multi-term: " name "*"))

    (insert (concat "ls"))))

(defun lazy-emacs/multi-term-kill ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "exit\n")
  (delete-window))

(global-set-key (kbd "C-!") 'lazy-emacs/multi-term-here)
(global-set-key (kbd "C-#") 'lazy-emacs/multi-term-kill)

(provide 'multi-term-config)

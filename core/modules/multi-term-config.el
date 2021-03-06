(lazy-emacs/require-package 'multi-term)

(custom-set-variables
 '(multi-term-buffer-name "Term"))

;; This code was copy paste from the internet long time ago
;; but I don't remember from who (sorry for the credits).
(defun lazy-emacs/multi-term-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The shell is renamed to match that
directory to make multiple shell windows easier."
  (interactive)
  (let* ((height (/ (window-total-height) 2)))
    (split-window-vertically (- height))
    (other-window 1)
    (multi-term)))

(defun lazy-emacs/multi-term-kill ()
  "Send ESC in term mode."
  (interactive)
  (term-send-raw-string "exit\n")
  (delete-window))

(global-set-key (kbd "C-!") 'lazy-emacs/multi-term-here)
(global-set-key (kbd "C-#") 'lazy-emacs/multi-term-kill)

(defun lazy-emacs/term-mode-local-variables ()
  (interactive)
  (local-set-key (kbd "s-k") 'erase-buffer)
  (setq show-trailing-whitespace nil))

(add-hook 'term-mode-hook #'lazy-emacs/term-mode-local-variables)

(provide 'multi-term-config)

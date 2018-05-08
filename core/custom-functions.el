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


;; Code from FrankRuben27 reddit user
(defun lazy-emacs/goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (call-interactively #'goto-line))
    (linum-mode -1)))

(global-set-key (kbd "M-n b r") 'lazy-emacs/revert-buffer-no-confirm)
(global-set-key (kbd "M-n b i") 'lazy-emacs/indent-whole-buffer)
(global-set-key (kbd "M-n b k") 'lazy-emacs/kill-other-buffers)

;; go-to is binded to more than one keyscombination
(global-set-key (kbd "M-g M-g") 'lazy-emacs/goto-line-with-feedback)
(global-set-key (kbd "M-g g")   'lazy-emacs/goto-line-with-feedback)

(defun lazy-emacs/diminish-minor-modes ()
  "Removes from the mode-line some minor modes"
  (interactive)

  (lazy-emacs/require-package 'diminish)

  (diminish 'aggressive-indent-mode)
  (diminish 'auto-revert-mode)
  (diminish 'beacon-mode)
  (diminish 'company-mode)
  (diminish 'editorconfig-mode)
  (diminish 'git-gutter-mode)
  (diminish 'ivy-mode)
  (diminish 'paredit-mode)
  (diminish 'undo-tree-mode)
  (diminish 'zoom-mode))

(provide 'custom-functions)

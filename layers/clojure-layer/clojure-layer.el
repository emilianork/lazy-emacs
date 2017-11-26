(defun lazy-emacs/clojure-mode-load ()
  (if (not (featurep 'clojure-mode))
      (progn
        (lazy-emacs/require-package 'clojure-mode)
        (clojure-mode)

        (add-hook 'clojure-mode-hook 'lazy-emacs/clojure-mode-keys)
        (add-hook 'clojure-mode-hook 'lazy-emacs/clojure-mode-load)))

  (lazy-emacs/require-package 'editorconfig)
  (lazy-emacs/require-package 'paredit)
  (lazy-emacs/require-package 'rainbow-delimiters)
  (lazy-emacs/require-package 'company)
  (lazy-emacs/require-package 'aggressive-indent)

  (lazy-emacs/load-magit)
  (lazy-emacs/load-cider)

  (aggressive-indent-mode t)
  (paredit-mode t)
  (rainbow-delimiters-mode t)
  (company-mode t)
  (show-paren-mode t)
  (editorconfig-mode t))

(defun lazy-emacs/clojure-mode-keys ()
  (interactive)
  (message "Loading clojure keys")
  (local-set-key (kbd "C-c M-f") 'lazy-emacs/cider-figwheel-repl)
  (local-set-key (kbd "M-n g s") 'magit-status))


(defun lazy-emacs/cider-figwheel-repl ()
  (interactive)
  (with-current-buffer
      (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!)
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))

(add-to-list 'auto-mode-alist
             '("\\.\\(clj\\|dtm\\|edn\\)\\'" . lazy-emacs/clojure-mode-load))
(add-to-list 'auto-mode-alist '("\\.cljc\\'" . lazy-emacs/clojure-mode-load))
(add-to-list 'auto-mode-alist '("\\.cljx\\'" . lazy-emacs/clojure-mode-load))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . lazy-emacs/clojure-mode-load))
;; boot build scripts are Clojure source files
(add-to-list 'auto-mode-alist '("\\(?:build\\|profile\\)\\.boot\\'" . lazy-emacs/clojure-mode-load))

(provide 'clojure-layer)

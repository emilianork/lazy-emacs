(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(add-to-list 'load-path "~/.emacs.d/core")

(require 'core)
(lazy-emacs/require 'config "~/.emacs.d/config")

(lazy-emacs/load-theme 'challenger-deep "challenger-deep-theme")
(lazy-emacs/load-config)
(lazy-emacs/server-start)
(put 'erase-buffer 'disabled nil)


(setq gc-cons-threshold 8000000
      gc-cons-percentage 0.1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-cljs-lein-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(elfeed-db-directory "~/.emacs.d/elfeed")
 '(multi-term-buffer-name "Term")
 '(org-agenda-files (quote ("~/Dropbox/Org/bookmarks.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

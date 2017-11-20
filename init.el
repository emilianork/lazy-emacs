(add-to-list 'load-path "~/.emacs.d/core/")
(load "~/.emacs.d/config")

(require 'core)
(require 'config)

(lazy-emacs/load-theme 'spacemacs-dark "spacemacs")
(lazy-emacs/load-config)
(lazy-emacs/server-start)

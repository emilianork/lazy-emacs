(add-to-list 'load-path "~/.emacs.d/core/")
(load "~/.emacs.d/config")

(require 'core)
(require 'config)

(lazy-emacs/load-theme 'spacemacs-light "spacemacs-themes")

(lazy-emacs/load-config)
(lazy-emacs/server-start)

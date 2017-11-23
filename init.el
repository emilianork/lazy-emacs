(add-to-list 'load-path "~/.emacs.d/core")

(require 'core)
(lazy-emacs/require 'config "~/.emacs.d/config")

(lazy-emacs/load-theme 'spacemacs-light "spacemacs" 'spacemacs-common)
(lazy-emacs/load-config)
(lazy-emacs/server-start)

(add-to-list 'load-path "~/.emacs.d/core")

(require 'core)
(lazy-emacs/require 'config "~/.emacs.d/config")

(lazy-emacs/load-theme 'wombat)
(lazy-emacs/load-config)
(lazy-emacs/server-start)

;; Extra emacs self added config
(put 'erase-buffer 'disabled nil)

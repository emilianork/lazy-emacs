(require 'server)

(defun lazy-emacs/server-start ()
  "Starts a new server only if there is no other already"
  (if (and (fboundp 'server-running-p) 
	   (not (server-running-p)))
      (server-start)))

(provide 'core-helpers)

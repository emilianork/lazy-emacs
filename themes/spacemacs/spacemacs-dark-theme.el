(if (not (featurep 'spacemacs-common))
    (load "~/.emacs.d/themes/spacemacs/spacemacs-common"))

(require 'spacemacs-common)

(deftheme spacemacs-dark "Spacemacs theme, the dark version")

(create-spacemacs-theme 'dark 'spacemacs-dark)

(provide-theme 'spacemacs-dark)

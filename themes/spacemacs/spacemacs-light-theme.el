(if (not (featurep 'spacemacs-common))
    (load "~/.emacs.d/themes/spacemacs/spacemacs-common"))

(require 'spacemacs-common)

(deftheme spacemacs-light "Spacemacs theme, the light version")

(create-spacemacs-theme 'light 'spacemacs-light)

(provide-theme 'spacemacs-light)

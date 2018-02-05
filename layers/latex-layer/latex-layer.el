;; Currently this is not working

(defun lazy-emacs/latex-mode-load ()
  (interactive)
  (if (not (featurep 'auctex))
      (progn
        (lazy-emacs/require-package 'auctex 'preview-latex)

        (TeX-load-hack)

        (add-hook 'LaTeX-mode-hook 'visual-line-mode)
        (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
        (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

        ;; Set column to 80
        (add-hook 'LaTeX-mode-hook      'lazy-emacs/latex-column-80)
        (add-hook 'plain-TeX-mode-hook  'lazy-emacs/latex-column-80)

        ;; Adds latexmk-dvi to the compilation commands list
        (LaTeX-mode)
        (push '("latexmk-dvi" "latexmk %s && dvipdf %s" TeX-run-TeX nil t :help "Run latexmk on file")
              TeX-command-list)

        (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk-dvi")))))

  (LaTeX-mode)

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-PDF-mode t)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-command-default "latexmk-dvi")

  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
        '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))))


(defun lazy-emacs/latex-column-80 ()
  (turn-on-auto-fill)
  (set-fill-column 80))

(add-to-list 'auto-mode-alist '("\\.tex\\'" . lazy-emacs/latex-mode-load))
(add-to-list 'auto-mode-alist '("\\.bib\\'" . lazy-emacs/latex-mode-load))

(provide 'latex-layer)

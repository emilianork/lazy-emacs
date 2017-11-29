(defun lazy-emacs/latex-mode-load ()
  (interactive)
  (if (not (featurep 'tex-site))
      (progn
        (lazy-emacs/require-package 'tex-site)

        (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
        (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

        ;; Adds latexmk-dvi to the compilation commands list
        (push '("latexmk-dvi" "latexmk %s && dvipdf %s" TeX-run-TeX nil t
                :help "Run latexmk on file")
              TeX-command-list)))

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-PDF-mode t)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-command-default "latexmk-dvi"))

(add-to-list 'auto-mode-alist '("\\.tex\\'" . lazy-emacs/latex-mode-load))
(add-to-list 'auto-mode-alist '("\\.bib\\'" . lazy-emacs/latex-mode-load))

(provide 'latex-layer)

(lazy-emacs/require-package 'undo-tree)

(global-undo-tree-mode)
(setq undo-tree-visualizer-timestamps t)
(setq undo-tree-visualizer-diff t)

(provide 'undo-tree-config)

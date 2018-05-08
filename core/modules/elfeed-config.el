(lazy-emacs/require-package 'elfeed)

(setq elfeed-feeds
      '("https://www.reddit.com/r/emacs/.rss"
        "https://www.reddit.com/r/unixporn/.rss"
        "https://www.reddit.com/r/programming/.rss"
        "http://planet.emacsen.org/atom.xml"))

(custom-set-variables
 '(elfeed-db-directory "~/.emacs.d/elfeed"))

(provide 'elfeed-config)

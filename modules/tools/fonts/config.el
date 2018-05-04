;;; tools/font/config.el -*- lexical-binding: t; -*-

(def-package! cnfonts
  :init
  (setq cnfonts-use-face-font-rescale t)
  (setq cnfonts-directory "~/.config/doom/modules/tools/fonts/profiles")
  (cnfonts-enable))

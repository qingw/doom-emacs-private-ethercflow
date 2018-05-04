;;; tools/font/config.el -*- lexical-binding: t; -*-

(def-package! cnfonts
  :init
  (setq cnfonts-use-face-font-rescale t)
  (cnfonts-enable))

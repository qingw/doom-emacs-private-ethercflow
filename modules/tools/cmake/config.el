;;; tools/cmake/config.el -*- lexical-binding: t; -*-


(def-package! cmake-ide
  :commands (cmake-ide-delete-file cide--mode-hook)
  :init
  (progn
    (dolist (hook '(c-mode-hook c++-mode-hook))
      ;; append the `cide--mode-hook' in order to load it last
      (add-hook hook 'cide--mode-hook 'append))

    (map! :map c-mode-base-map
          :localleader
          :prefix "b"
          :nv "c" #'cmake-ide-compile
          :nv "r" #'cmake-ide-run-cmake
          :nv "m" #'cmake-ide-maybe-run-cmake
          :nv "d" #'cmake-ide-delete-file))

  :config (cmake-ide-setup))

;;; tools/fasd/config.el -*- lexical-binding: t; -*-


(defvar fasd-map
  (let ((map (make-sparse-keymap)))
    (define-key map "d" 'fasd-find-directory-only)
    (define-key map "o" 'fasd-find-file-only)
    (define-key map "f" 'fasd-find-file)
    map))

(def-package! fasd
  :init
  (progn
    (global-fasd-mode 1)
    ;; we will fall back to using the default completing-read function, which is helm once helm is loaded.
    (setq fasd-completing-read-function 'nil)))

(defun fasd-find-file-only ()
  (interactive)
  (fasd-find-file -1))

(defun fasd-find-directory-only ()
  (interactive)
  (fasd-find-file 1))

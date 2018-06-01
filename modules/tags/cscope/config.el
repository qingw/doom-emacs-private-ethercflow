;;; tags/cscope/config.el -*- lexical-binding: t; -*-

(def-package! xcscope
  :commands (cscope-index-files cscope/run-pycscope)
  :init
  (progn
    ;; for python projects, we don't want xcscope to rebuild the databse,
    ;; because it uses cscope instead of pycscope
    (setq cscope-option-do-not-update-database t
          cscope-display-cscope-buffer nil)

    (defun cscope//safe-project-root ()
      "Return project's root, or nil if not in a project."
      (and (fboundp 'projectile-project-root)
           (projectile-project-p)
           (projectile-project-root)))

    (defun cscope/run-pycscope (directory)
      (interactive (list (file-name-as-directory
                          (read-directory-name "Run pycscope in directory: "
                                               (cscope//safe-project-root)))))
      (let ((default-directory directory))
        (shell-command
         (format "pycscope -R -f '%s'"
                 (expand-file-name "cscope.out" directory)))))))

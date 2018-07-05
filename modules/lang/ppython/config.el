;; -*- no-byte-compile: t; -*-
;;; lang/ppython/config.el

(def-package! pyenv-mode
  :when (featurep! :lang python)
  :config
  (setenv "WORKON_HOME" "~/miniconda3/envs")
  (pyenv-mode 1)

  (defun projectile-pyenv-mode-set ()
    "Set pyenv version matching project name."
    (let ((project (projectile-project-name)))
      (if (member project (pyenv-mode-versions))
          (pyenv-mode-set project)
        (pyenv-mode-unset))))

  (add-hook 'projectile-after-switch-project-hook
            'projectile-pyenv-mode-set))


(def-package! py-autopep8
  :when (featurep! :lang python)
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

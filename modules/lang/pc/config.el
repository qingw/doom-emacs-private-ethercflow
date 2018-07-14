;;; lang/pc/config.el -*- lexical-binding: t; -*-

(def-package! ccls
  :init (add-hook! (c-mode c++-mode) #'+ccls//enable)
  :config
  (setq ccls-executable "/usr/local/bin/ccls"
        ccls-cache-dir (concat doom-cache-dir ".ccls_cached_index"))
  (setq ccls-extra-init-params
        '(:completion (:detailedLabel t)
                      :diagnostics (:frequencyMs 5000)
                      :index (:initialReparseForDependency :json-false)))

  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories ".ccls-cache"))

  (evil-set-initial-state 'ccls-tree-mode 'emacs)
  (set! :company-backend '(c-mode c++-mode) 'company-lsp))

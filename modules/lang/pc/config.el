;;; lang/pc/config.el -*- lexical-binding: t; -*-

(def-package! ccls
  :defer t
  :init (add-hook! (c-mode c++-mode objc-mode) #'+ccls//enable)
  :config
  ;; overlay is slow
  ;; Use https://github.com/emacs-mirror/emacs/commits/feature/noverlay
  (setq ccls-sem-highlight-method 'font-lock)
  (add-hook 'lsp-after-open-hook #'ccls-code-lens-mode)
  (ccls-use-default-rainbow-sem-highlight)
  ;; https://github.com/maskray/ccls/blob/master/src/config.h
  (setq
   ccls-extra-init-params
   `(:clang (:extraArgs ["--gcc-toolchain=/usr"]
             :pathMappings ,+ccls-path-mappings)
            :completion
            (:include
             (:blacklist
              ["^/usr/(local/)?include/c\\+\\+/[0-9\\.]+/(bits|tr1|tr2|profile|ext|debug)/"
               "^/usr/(local/)?include/c\\+\\+/v1/"
               ]))
            :index (:initialBlacklist ,+ccls-initial-blacklist :trackDependency 1)))

  (with-eval-after-load 'projectile
    (add-to-list 'projectile-globally-ignored-directories ".ccls-cache"))

  (evil-set-initial-state 'ccls-tree-mode 'emacs)
  (set-company-backend! '(c-mode c++-mode objc-mode) 'company-lsp)
  )

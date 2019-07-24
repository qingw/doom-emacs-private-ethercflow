;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

(map! :leader
      (:desc "+file" :prefix "f"
        :n "f" fasd-map))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-ui-doc-background ((t (:background "gray18"))))
 '(lsp-ui-doc-header ((t (:background "dim gray" :foreground "white")))))

(setq rustic-lsp-server 'rust-analyzer)

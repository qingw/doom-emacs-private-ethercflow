;;; tools/lsp/config.el -*- lexical-binding: t; -*-


(def-package! lsp-mode
  :commands (lsp-mode))

(def-package! lsp-ui
  :demand t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq
   lsp-ui-sideline-enable nil
   lsp-ui-doc-header nil
   lsp-ui-doc-include-signature nil
   lsp-ui-doc-background (doom-color 'base4)
   lsp-ui-doc-border (doom-color 'fg)

   lsp-ui-peek-force-fontify nil
   lsp-ui-peek-expand-function (lambda (xs) (mapcar #'car xs))))

(def-package! company-lsp
  :after lsp-mode
  :init
  (setq company-quickhelp-delay 0
        company-transformers nil
        company-lsp-async t
        company-lsp-cache-candidates nil))

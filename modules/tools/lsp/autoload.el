;;; tools/lsp/autoloads.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +my/lsp-ui-doc--eldoc (&rest _)
  (when (and (lsp--capability "documentHighlightProvider")
             lsp-highlight-symbol-at-point)
    (lsp-symbol-highlight))
  (if (evil-insert-state-p)
      (lsp--text-document-signature-help)
      lsp-ui-doc--string-eldoc
      ))

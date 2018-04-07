;;; config.el --- description -*- lexical-binding: t; -*-

(def-package! org-page
  :config
  (setq op/repository-directory "~/Documents/Blog"
        op/site-domain "https://ethercflow.github.io"
        op/personal-disqus-shortname "ethercflow"
        op/personal-google-analytics-id "UA-116911520-1"
        op/site-main-title "Zwb's Up"
        op/site-sub-title "=============> 这里没有上帝，只有属于我们自己的信条。"
        op/personal-github-link "https://github.com/ethercflow"
        op/confound-email nil
        op/category-config-alist
        '(("blog" ;; this is the default configuration
           :show-meta t
           :show-comment t
           :uri-generator op/generate-uri
           :uri-template "/blog/%y/%m/%d/%t/"
           :sort-by :date     ;; how to sort the posts
           :category-index t) ;; generate category index or not
          ("wiki"
           :show-meta t
           :show-comment nil
           :uri-generator op/generate-uri
           :uri-template "/wiki/%t/"
           :sort-by :mod-date
           :category-index t)
          ("index"
           :show-meta nil
           :show-comment nil
           :uri-generator op/generate-uri
           :uri-template "/"
           :sort-by :date
           :category-index nil)
          ("about"
           :show-meta nil
           :show-comment nil
           :uri-generator op/generate-uri
           :uri-template "/about/"
           :sort-by :date
           :category-index nil))))

(def-package! fcitx
  :after evil
  :config
  (fcitx-evil-turn-on))

;; lang/c
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/Documents/SRE")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))))

(provide 'config)
;;; config.el ends here

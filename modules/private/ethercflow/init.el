;;; private/ethercflow/init.el -*- lexical-binding: t; -*-

(setq user-mail-address "ethercflow@gmail.com"
      user-full-name    "Zwb")

(setq default-frame-alist '((ns-transparent-titlebar . t) (ns-appearance . 'nil)))

(setq doom-font (font-spec :family "Inconsolata" :size 17)
      doom-big-font (font-spec :family "Inconsolata" :size 17)
      doom-unicode-font (font-spec :family "Inconsolata" :size 17)
      doom-variable-pitch-font (font-spec :family "Inconsolata" :size 17))

;; Auto generated by cnfonts
;; <https://github.com/tumashu/cnfonts>
(defun s-font()
  (set-face-attribute
   'default nil
   :font (font-spec :name "-*-Inconsolata-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
                    :weight 'normal
                    :slant 'normal
                    :size 17.0))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :name "-*-STFangsong-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
                :weight 'normal
                :slant 'normal
                :size 18.5))))
(if window-system
    (s-font))

(define-coding-system-alias 'UTF-8 'utf-8)

(setq +org-dir (expand-file-name "~/Documents/org/")
      org-ellipsis " ▼ ")

(setq doom-line-numbers-style 'relative)
(toggle-frame-fullscreen)

(add-hook 'before-save-hook 'whitespace-cleanup)

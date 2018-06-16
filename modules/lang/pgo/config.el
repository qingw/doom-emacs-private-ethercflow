;;; lang/pgo/config.el -*- lexical-binding: t; -*-

(after! go-mode
  (def-menu! +go/edit-menu
    "Edit commands for `go-mode' buffers."
    '(("Fill struct"      :exec go-fill-struct)
      ("Add tag"          :exec go-tag-add)
      ("Remove tag"       :exec go-tag-remove)
      ("Gen method stubs" :exec go-impl))
    :prompt "Edit: ")

  (def-menu! +go/doctor-menu
    "Godoctor commands for `go-mode' buffers."
    '(("Local doc"        :exec godoctor-godoc)
      ("Extract"          :exec godoctor-extract)
      ("Rename"           :exec godoctor-rename)
      ("Toggle var ⇔ :=" :exec godoctor-toggle))
    :prompt "Godoctor: ")

  (map! :map go-mode-map
        :localleader
        :n "d" #'+go/doctor-menu
        :n "e" #'+go/edit-menu))

(setq godoc-at-point-function 'godoc-gogetdoc)

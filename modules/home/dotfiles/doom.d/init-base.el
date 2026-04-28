;;; init-base.el -*- lexical-binding: t; -*-

(doom! :completion
       vertico

       :ui
       deft
       doom
       doom-dashboard
       hl-todo
       modeline
       (popup +all +defaults)
       treemacs
       vc-gutter
       workspaces

       :editor
       (evil +everywhere)
       format
       multiple-cursors
       snippets

       :emacs
       dired
       electric
       undo
       vc

       :term
       eat

       :checkers
       syntax

       :tools
       (debugger +lsp)
       direnv
       (docker +lsp)
       (eval +overlay)
       lookup
       (lsp +eglot)
       magit
       pdf
       (tree-sitter +everywhere)

       :os
       (:if IS-MAC macos)
       (tty +osc)

       :lang
       cc
       common-lisp
       data
       emacs-lisp
       go
       json
       (latex +cdlatex +latexmk)
       lua
       (markdown +grip)
       nix
       (python +lsp +pyright)
       sh)

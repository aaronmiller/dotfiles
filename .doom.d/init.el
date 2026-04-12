;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (vertico +icons)    ; Leanest, fastest search/completion engine

       :ui
       deft                ; Notational velocity
       doom                ; Core UI
       doom-dashboard      ; Managed splash screen for faster startup
       hl-todo             ; Low-overhead TODO highlighting
       modeline            ; Snazzy modeline
       (popup +all +defaults) ; Mandatory window management
       treemacs            ; Project drawer
       vc-gutter           ; Fringe diffs (standard fringe is faster than +pretty)
       workspaces          ; Workspace isolation
       zen                 ; Distraction-free mode

       :editor
       (evil +everywhere)  ; Mandatory for your keybindings
       format              ; Automated prettiness (black, isort, etc.)
       multiple-cursors    ; Efficient multi-line editing
       snippets            ; Required for LSP templates

       :emacs
       dired               ; Best-in-class file management
       electric            ; Native indent logic
       undo                ; Persistent undo
       vc                  ; Core version control

       :term
       vterm               ; Fastest terminal (C-module based)

       :checkers
       syntax              ; Flycheck feedback

       :tools
       (debugger +lsp)     ; Debugging via LSP
       direnv              ; Environment management
       (docker +lsp)       ; Docker integration
       (eval +overlay)     ; Code evaluation
       lookup              ; Jump-to-definition/documentation
       (lsp +eglot)        ; Eglot is the performance-first LSP client
       magit               ; Mandatory git interface
       pdf                 ; PDF-tools support
       (tree-sitter +everywhere) ; C-based parsing for max scrolling speed

       :os
       (:if IS-MAC macos)  ; Essential macOS path/clipboard fixes
       (tty +osc)          ; Terminal enhancements

       :lang
       cc                  ; C/C++
       common-lisp         ; Lisp
       data                ; JSON/YAML/XML
       emacs-lisp          ; Self-config speed
       go                  ; Go
       json                ; JSON performance
       java                ; Java
       (latex +cdlatex +latexmk) ; Optimized LaTeX
       lua                 ; Fast scripting
       (markdown +grip)    ; Docs
       (python +lsp +pyright) ; Python
       sh                  ; Shell scripts

       :config
       ;; +bindings: Restores SPC leader keys and project commands (SPC p)
       (default +smartparens +bindings)) 


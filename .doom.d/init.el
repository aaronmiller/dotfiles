;;; init.el -*- lexical-binding: t; -*-

;; Optimized for Emacs 30.2 Performance
;; Use 'doom sync' after changes.

(doom! :completion
       vertico                                  ; Minimalist vertical completion UI

       :ui
       deft                                     ; Fast note-taking/searching
       doom                                     ; Core Doom visuals
       doom-dashboard                           ; Efficient splash screen
       hl-todo                                  ; Low-overhead TODO highlighting
       modeline                                 ; Optimized status bar
       (popup +all +defaults)                   ; Rules-based window management
       treemacs                                 ; Sidebar file browser
       vc-gutter                                ; Fast fringe-based diffs
       workspaces                               ; Isolated buffer/tab management
       zen                                      ; Distraction-free interface

       :editor
       (evil +everywhere)                       ; Better Vim integration
       format                                   ; On-save code formatting
       multiple-cursors                         ; High-speed multi-line editing
       snippets                                 ; Template expansion engine

       :emacs
       dired                                    ; High-performance file management
       electric                                 ; Native indentation logic
       undo                                     ; Persistent undo history
       vc                                       ; Core version control support

       :term
       eat                                      ; Hello, simplicity

       :checkers
       syntax                                   ; Real-time error feedback

       :tools
       (debugger +lsp)                          ; Debug Adapter Protocol support
       direnv                                   ; Per-project environment variables
       (docker +lsp)                            ; Container management
       (eval +overlay)                          ; Inline code execution
       lookup                                   ; Jump-to-definition & documentation
       (lsp +eglot)                             ; Optimized, native-feel LSP client
       magit                                    ; Premier Git interface
       pdf                                      ; High-speed PDF viewer
       (tree-sitter +everywhere)                ; C-level syntax parsing

       :os
       (:if IS-MAC macos)                       ; macOS-specific system integration
       (tty +osc)                               ; Terminal-based enhancements

       :lang
       cc                                       ; C-family
       common-lisp                              ; Lisp
       data                                     ; JSON/YAML/XML
       emacs-lisp                               ; Self-configuration
       go                                       ; Go
       java                                     ; Java
       json                                     ; Data structures
       (latex +cdlatex +latexmk)                ; Scientific writing
       lua                                      ; Scripting
       (markdown +grip)                         ; Documentation
       (python +lsp +pyright)                   ; Python with Eglot
       sh                                       ; Shell scripting

       :config
       ;; Restores SPC leader keys and project commands
       (default +smartparens +bindings))

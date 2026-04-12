;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; Unpin icons to ensure compatibility with the latest Treemacs
(unpin! treemacs-nerd-icons)

;; UI & Visuals
(package! treemacs-nerd-icons
  :recipe (:host github :repo "aaronmiller/treemacs-nerd-icons"))

;; Languages & Editing
(package! clang-format)
(package! google-c-style)
(package! rego-mode)
(package! xenops)        ; LaTeX math rendering
(package! evil-tutor)    ; Useful for vim-style practice

;; Disable redundant built-ins to save on load time
(package! doom-snippets :disable t)

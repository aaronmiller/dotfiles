;; -*- no-byte-compile: t; -*-
;;; packages.el -*- lexical-binding: t; -*-

(package! doom-snippets :disable t)

(unpin! treemacs-nerd-icons)
(package! treemacs-nerd-icons
  :recipe (:host github :repo "aaronmiller/treemacs-nerd-icons"))

(package! yasnippet-snippets)

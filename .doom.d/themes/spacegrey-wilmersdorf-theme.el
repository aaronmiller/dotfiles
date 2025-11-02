;;; doom-spacegrey-theme.el --- I'm sure you've heard of it -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: December 31, 2017 (#129)
;; Author: teesloane <https://github.com/teesloane>
;; Maintainer:
;; Source: http://kkga.github.io/spacegray/
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(require 'doom-themes)

(defgroup doom-spacegrey-theme nil
  "Options for the `doom-spacegrey' theme."
  :group 'doom-themes)

(defcustom doom-spacegrey-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-spacegrey-theme
  :type 'boolean)

(defcustom doom-spacegrey-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-spacegrey-theme
  :type 'boolean)

(defcustom doom-spacegrey-comment-bg doom-spacegrey-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-spacegrey-theme
  :type 'boolean)

(defcustom doom-spacegrey-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-spacegrey-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme spacegrey-wilmersdorf
  "A dark theme inspired by Atom Spacegrey Dark"

  ;; default bg #2b303b
  ;; spacegrey
  ;; name        default   256       16
  ((bg         '("#10414c" "#10414c" nil            ))
   (bg-alt     '("#083941" "#083941" nil            ))
   (base0      '("#00333a" "#00333a" "black"        ))
   (base1      '("#013035" "#013035" "brightblack"  ))
   (base2      '("#053439" "#053439" "brightblack"  ))
   (base3      '("#144348" "#144348" "brightblack"  ))
   (base4      '("#346c77" "#346c77" "brightblack"  ))
   (base5      '("#4a848f" "#4a848f" "brightblack"  ))
   (base6      '("#588a8f" "#588a8f" "brightblack"  ))
   (base7      '("#81b1b5" "#81b1b5" "brightblack"  ))
   (base8      '("#c4f0f0" "#c4f0f0" "white"        ))
   (fg         '("#a5d6df" "#a5d6df" "brightwhite"  ))
   (fg-alt     '("#a5d6df" "#a5d6df" "white"        ))

   ;; wilmersdorf
   (grey       base4)
   (red        '("#c6d2ff" "#c6d2ff" "red"          ))
   (orange     '("#8bd2f1" "#8bd2f1" "brightred"    ))
   (green      '("#40a5bc" "#40a5bc" "green"        ))
   (teal       '("#63cfce" "#63cfce" "brightgreen"  ))
   (yellow     '("#b4e0ad" "#b4e0ad" "yellow"       ))
   (blue       '("#66ade7" "#66ade7" "brightblue"   ))
   (light-blue '("#75b7ec" "#75b7ec" "yellow"       ))
   (dark-blue  '("#467da7" "#467da7" "blue"         ))
   (magenta    '("#8bd2f1" "#8bd2f1" "magenta"      ))
   (violet     '("#95b3f8" "#95b3f8" "brightmagenta"))
   (cyan       '("#579acd" "#579acd" "brightcyan"   ))
   (dark-cyan  '("#5389aa" "#5389aa" "cyan"   ))

   ;; face categories -- required for all themes
   (highlight      orange)
   (vertical-bar   (doom-darken bg 0.25))
   (selection      base4)
   (builtin        orange)
   (comments       (if doom-spacegrey-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-spacegrey-brighter-comments dark-cyan base5) 0.25))
   (constants      orange)
   (functions      blue)
   (keywords       violet)
   (methods        blue)
   (operators      fg)
   (type           yellow)
   (strings        green)
   (variables      red)
   (numbers        orange)
   (region         selection)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg-alt) "black" "black"))
   (-modeline-bright doom-spacegrey-brighter-modeline)
   (-modeline-pad
    (when doom-spacegrey-padded-modeline
      (if (integerp doom-spacegrey-padded-modeline) doom-spacegrey-padded-modeline 4)))

   (modeline-fg     'unspecified)
   (modeline-fg-alt (doom-blend violet base4 (if -modeline-bright 0.5 0.2)))
   (modeline-bg bg-alt)
   (modeline-bg-l bg-alt)
   (modeline-bg-inactive bg-alt)
   (modeline-bg-inactive-l bg-alt))


  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-spacegrey-comment-bg (doom-lighten bg 0.05) 'unspecified))
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground fg)
   (css-selector             :foreground red)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-darken bg 0.1))
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground fg :weight 'ultra-bold)
   ((outline-2 &override) :foreground (doom-blend fg blue 0.35))
   ((outline-3 &override) :foreground (doom-blend fg blue 0.7))
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground (doom-blend magenta blue 0.2))
   ((outline-6 &override) :foreground (doom-blend magenta blue 0.4))
   ((outline-7 &override) :foreground (doom-blend magenta blue 0.6))
   ((outline-8 &override) :foreground fg)
   ;;;; org <built-in>
   (org-block            :background (doom-darken bg-alt 0.04))
   (org-block-begin-line :foreground base4 :slant 'italic :background (doom-darken bg 0.04))
   (org-ellipsis         :underline nil :background bg    :foreground red)
   ((org-quote &override) :background base1)
   (org-hide :foreground bg)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l))))

  ;;;; Base theme variable overrides-
  ;; ()
  )

;;; doom-spacegrey-theme.el ends here

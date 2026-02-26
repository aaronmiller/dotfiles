;;; doom-wilmersdorf-theme.el --- port of Ian Pan's Wilmersdorf -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: August 12, 2019 (6035392a1a01)
;; Author: ema2159 <https://github.com/ema2159>
;; Maintainer:
;; Source: https://github.com/ianpan870102/wilmersdorf-emacs-theme
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-wilmersdorf-theme nil
  "Options for the `doom-wilmersdorf' theme."
  :group 'doom-themes)

(defcustom doom-wilmersdorf-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-wilmersdorf-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme moonlight-wilmersdorf-inverted
  "A dark theme inspired by Ian Pan's Wilmersdorf"

  ;; default bg #212337
  ;; moonlight
  ;; name        default   256       16
  ((bg         '("#f4d9be" "#f4d9be" "black"))
   (bg-alt     '("#fce2cb" "#fce2cb" "black"))
   (base0      '("#ffe2cb" "#ffe2cb" "black"))
   (base1      '("#fce2cb" "#fce2cb" "brightblack"))
   (base2      '("#f7dcc5" "#f7dcc5" "brightblack"))
   (base3      '("#f3d8bf" "#f3d8bf" "brightblack"))
   (base4      '("#e6c9a8" "#e6c9a8" "brightblack"))
   (base5      '("#d1b282" "#d1b282" "brightblack"))
   (base6      '("#93713d" "#93713d" "brightblack"))
   (base7      '("#6c440d" "#6c440d" "brightblack"))
   (base8      '("#613a05" "#613a05" "white"))
   (indigo     '("#9b7426" "#9b7426" "brightblack"))
   (region     '("#ddbe99" "#ddbe99" "brightblack"))
   (fg         '("#4d2900" "#4d2900" "brightwhite"))
   (fg-alt     '("#613a05" "#613a05" "white"))

   ;; wilmersdorf
   (grey       base4)
   (red        '("#343b07" "#343b07" "red"          ))
   (orange     '("#6f3b15" "#6f3b15" "brightred"    ))
   (green      '("#ba684a" "#ba684a" "green"        ))
   (teal       '("#973e38" "#973e38" "brightgreen"  ))
   (yellow     '("#462d59" "#462d59" "yellow"       ))
   (blue       '("#94601f" "#94601f" "brightblue"   ))
   (light-blue '("#85561a" "#85561a" "yellow"       ))
   (dark-blue  '("#b4905f" "#b4905f" "blue"         ))
   (magenta    '("#6f3b15" "#6f3b15" "magenta"      ))
   (violet     '("#655a0e" "#655a0e" "brightmagenta"))
   (cyan       '("#a37339" "#a37339" "brightcyan"   ))
   (dark-cyan  '("#a7845c" "#a7845c" "cyan"   ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)
   (builtin        teal)
   (comments       dark-cyan)
   (doc-comments   (doom-lighten dark-cyan 0.25))
   (constants      magenta)
   (functions      teal)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           violet)
   (strings        green)
   (variables      magenta)
   (numbers        magenta)
   (region         base3)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-pad
    (when doom-wilmersdorf-padded-modeline
      (if (integerp doom-wilmersdorf-padded-modeline) doom-wilmersdorf-padded-modeline 4)))

   (modeline-fg     'unspecified)
   (modeline-fg-alt base5)

   (modeline-bg bg-alt)
   (modeline-bg-l bg-alt)
   (modeline-bg-inactive bg-alt)
   (modeline-bg-inactive-l bg-alt))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground highlight)
   ((mode-line-highlight &override) :background teal)

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background highlight)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face    :foreground teal :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)
   ;;;; mic-paren
   (paren-face-match    :foreground teal   :background base0 :weight 'ultra-bold)
   (paren-face-mismatch :foreground red :background violet   :weight 'ultra-bold)
   (paren-face-no-match :inherit 'paren-face-mismatch :weight 'ultra-bold)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground blue)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground (doom-darken blue 0.2))
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken blue 0.4))
   ((outline-8 &override) :foreground (doom-darken green 0.4))
   ;;;; org <built-in>
   ((org-block &override) :background base2)
   ((org-block-begin-line &override) :background base2)
   (org-hide :foreground hidden)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   ;; Font-Lock
   (font-lock-comment-face
    :foreground comments
    :inherit 'italic)
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
    (font-lock-comment-delimiter-face    :inherit font-lock-comment-face))

  ;;;; Base theme variable overrides-
  ()
  )

;;; doom-wilmersdorf-theme.el ends here

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

(def-doom-theme moonlight-wilmersdorf
  "A dark theme inspired by Ian Pan's Wilmersdorf"

  ;; default bg #212337
  ;; moonlight
  ;; name        default   256       16
  ((bg         '("#0b2d41" "#0b2d41" "black"))
   (bg-alt     '("#032434" "#032434" "black"))
   (base0      '("#002434" "#002434" "black"))
   (base1      '("#032434" "#032434" "brightblack"))
   (base2      '("#082a3a" "#082a3a" "brightblack"))
   (base3      '("#0c2e40" "#0c2e40" "brightblack"))
   (base4      '("#193d57" "#193d57" "brightblack"))
   (base5      '("#2e547d" "#2e547d" "brightblack"))
   (base6      '("#6c95c2" "#6c95c2" "brightblack"))
   (base7      '("#93c2f2" "#93c2f2" "brightblack"))
   (base8      '("#9eccfa" "#9eccfa" "white"))
   (indigo     '("#6492d9" "#6492d9" "brightblack"))
   (region     '("#224866" "#224866" "brightblack"))
   (fg         '("#b2ddff" "#b2ddff" "brightwhite"))
   (fg-alt     '("#9eccfa" "#9eccfa" "white"))

   ;; wilmersdorf
   (grey       base4)
   (red        '("#cbcbf8" "#cbcbf8" "red"          ))
   (orange     '("#90cbea" "#90cbea" "brightred"    ))
   (green      '("#459eb5" "#459eb5" "green"        ))
   (teal       '("#68c8c7" "#68c8c7" "brightgreen"  ))
   (yellow     '("#b9d9a6" "#b9d9a6" "yellow"       ))
   (blue       '("#6ba6e0" "#6ba6e0" "brightblue"   ))
   (light-blue '("#7ab0e5" "#7ab0e5" "yellow"       ))
   (dark-blue  '("#4b76a0" "#4b76a0" "blue"         ))
   (magenta    '("#90cbea" "#90cbea" "magenta"      ))
   (violet     '("#9aacf1" "#9aacf1" "brightmagenta"))
   (cyan       '("#5c93c6" "#5c93c6" "brightcyan"   ))
   (dark-cyan  '("#5882a3" "#5882a3" "cyan"   ))

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
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l))))

  ;;;; Base theme variable overrides-
  ()
  )

;;; doom-wilmersdorf-theme.el ends here

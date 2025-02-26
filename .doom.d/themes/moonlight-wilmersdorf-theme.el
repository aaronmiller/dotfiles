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

  ;; name        default   256       16
  ((bg         '("#0b3741" "#0b3741" "black"))
   (bg-alt     '("#032e34" "#032e34" "black"))
   (base0      '("#002e34" "#002e34" "black"))
   (base1      '("#032e34" "#032e34" "brightblack"))
   (base2      '("#08343a" "#08343a" "brightblack"))
   (base3      '("#0c3840" "#0c3840" "brightblack"))
   (base4      '("#194757" "#194757" "brightblack"))
   (base5      '("#2e5e7d" "#2e5e7d" "brightblack"))
   (base6      '("#6c9fc2" "#6c9fc2" "brightblack"))
   (base7      '("#93ccf2" "#93ccf2" "brightblack"))
   (base8      '("#9ed6fa" "#9ed6fa" "white"))
   (indigo     '("#649cd9" "#649cd9" "brightblack"))
   (region     '("#225266" "#225266" "brightblack"))
   (fg         '("#b2e7ff" "#b2e7ff" "brightwhite"))
   (fg-alt     '("#9ed6fa" "#9ed6fa" "white"))

   (grey       base5)
   (red        '("#cbd5f8" "#cbd5f8" "red"          ))
   (orange     '("#90d5ea" "#90d5ea" "brightred"    ))
   (green      '("#45a8b5" "#45a8b5" "green"        ))
   (teal       '("#68d2c7" "#68d2c7" "brightgreen"  ))
   (yellow     '("#b9e3a6" "#b9e3a6" "yellow"       ))
   (blue       '("#6bb0e0" "#6bb0e0" "brightblue"   ))
   (light-blue '("#7abae5" "#7abae5" "yellow"       ))
   (dark-blue  '("#4b80a0" "#4b80a0" "blue"         ))
   (magenta    '("#90d5ea" "#90d5ea" "magenta"      ))
   (violet     '("#9ab6f1" "#9ab6f1" "brightmagenta"))
   (cyan       '("#5c9dc6" "#5c9dc6" "brightcyan"   ))
   (dark-cyan  '("#588ca3" "#588ca3" "cyan"   ))

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

   (modeline-bg
    `(,(doom-darken (car bg) 0.1) ,@(cdr base0)))
   (modeline-bg-l
    `(,(doom-darken (car bg) 0.15) ,@(cdr base0)))
   (modeline-bg-inactive   `(,(car bg) ,@(cdr base1)))
   (modeline-bg-inactive-l (doom-darken bg 0.1)))


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

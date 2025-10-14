;;; doom-earl-grey-theme.el --- a gentle color scheme, for code -*- no-byte-compile: t; -*-
;;
;; Added: August 30, 2021 (#653)
;; Author: JuneKelly <https://github.com/JuneKelly>
;; Maintainer:
;; Source: original
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-earl-grey-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-earl-grey-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-earl-grey-theme
  :type 'boolean)

(defcustom doom-earl-grey-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-earl-grey-theme
  :type 'boolean)

(defcustom doom-earl-grey-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-earl-grey-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme earl-grey
  "A gentle color scheme for code."

  ;; name        default   256       16
  (
   ;; Earl Grey Colors
   (eg-fg       '("#635e58" "#635e58" ""))
   (eg-fg2      '("#4f4b47" "#4f4b47" ""))
   (eg-bg       '("#ffffff" "#ffffff" "white"))
   (eg-bg2      '("#faf7f4" "#faf7f4" "white"))

   (eg-purple   '("#865b83" "#865b83" "magenta"))
   (eg-blue     '("#586d9b" "#586d9b" "brightblue"))
   (eg-teal     '("#4a7e81" "#4a7e81" "brightgreen"))
   (eg-orange   '("#8b6e4a" "#8b6e4a" "brightred"))
   (eg-green    '("#777f53" "#777f53" "green"))
   (eg-red      '("#925a58" "#925a58" "red"))
   (eg-berry    '("#ad548d" "#ad548d" "brightmagenta"))

   (eg-grey1    '("#efefee" "#efefee" "white"))
   (eg-grey2    '("#e0dfde" "#e0dfde" "brightblack"))
   (eg-grey3    '("#d0cfcd" "#d0cfcd" "brightblack"))
   (eg-grey4    '("#c1bfbc" "#c1bfbc" "brightblack"))
   (eg-grey5    '("#b1afac" "#b1afac" "brightblack"))
   (eg-grey6    '("#a19e9b" "#a19e9b" "brightblack"))
   (eg-grey7    '("#928e8a" "#928e8a" "brightblack"))
   (eg-grey8    '("#827e79" "#827e79" "brightblack"))
   (eg-grey9    '("#736e69" "#736e69" "brightblack"))

   (eg-purple1  '("#f3eff3" "#f3eff3" "brightmagenta"))
   (eg-purple2  '("#e7dee6" "#e7dee6" "brightmagenta"))
   (eg-purple3  '("#dbceda" "#dbceda" "brightmagenta"))
   (eg-purple4  '("#cfbdcd" "#cfbdcd" "brightmagenta"))
   (eg-purple5  '("#c3adc1" "#c3adc1" "brightmagenta"))
   (eg-purple6  '("#b69db5" "#b69db5" "brightmagenta"))
   (eg-purple7  '("#aa8ca8" "#aa8ca8" "brightmagenta"))
   (eg-purple8  '("#9e7c9c" "#9e7c9c" "magenta"))
   (eg-purple9  '("#926b8f" "#926b8f" "magenta"))

   (eg-blue1    '("#eef0f5" "#eef0f5" "brightblue"))
   (eg-blue2    '("#dee2eb" "#dee2eb" "brightblue"))
   (eg-blue3    '("#cdd3e1" "#cdd3e1" "brightblue"))
   (eg-blue4    '("#bcc5d7" "#bcc5d7" "brightblue"))
   (eg-blue5    '("#acb6cd" "#acb6cd" "brightblue"))
   (eg-blue6    '("#9ba7c3" "#9ba7c3" "brightblue"))
   (eg-blue7    '("#8a99b9" "#8a99b9" "brightblue"))
   (eg-blue8    '("#798aaf" "#798aaf" "blue"))
   (eg-blue9    '("#697ca5" "#697ca5" "blue"))

   (eg-teal1    '("#edf2f2" "#edf2f2" "brightgreen"))
   (eg-teal2    '("#dbe5e6" "#dbe5e6" "brightgreen"))
   (eg-teal3    '("#c9d8d9" "#c9d8d9" "brightgreen"))
   (eg-teal4    '("#b7cbcd" "#b7cbcd" "brightgreen"))
   (eg-teal5    '("#a5bfc0" "#a5bfc0" "brightgreen"))
   (eg-teal6    '("#92b2b3" "#92b2b3" "brightgreen"))
   (eg-teal7    '("#80a5a7" "#80a5a7" "brightgreen"))
   (eg-teal8    '("#6e989a" "#6e989a" "brightgreen"))
   (eg-teal9    '("#5c8b8e" "#5c8b8e" "brightgreen"))

   (eg-orange1  '("#f3f1ed" "#f3f1ed" "brightred"))
   (eg-orange2  '("#e8e2db" "#e8e2db" "brightred"))
   (eg-orange3  '("#dcd4c9" "#dcd4c9" "brightred"))
   (eg-orange4  '("#d1c5b7" "#d1c5b7" "brightred"))
   (eg-orange5  '("#c5b7a5" "#c5b7a5" "brightred"))
   (eg-orange6  '("#b9a892" "#b9a892" "brightred"))
   (eg-orange7  '("#ae9a80" "#ae9a80" "brightred"))
   (eg-orange8  '("#a28b6e" "#a28b6e" "brightred"))
   (eg-orange9  '("#977d5c" "#977d5c" "brightred"))

   (eg-green1   '("#f1f2ee" "#f1f2ee" "green"))
   (eg-green2   '("#e4e5dd" "#e4e5dd" "green"))
   (eg-green3   '("#d6d9cb" "#d6d9cb" "green"))
   (eg-green4   '("#c9ccba" "#c9ccba" "green"))
   (eg-green5   '("#bbbfa9" "#bbbfa9" "green"))
   (eg-green6   '("#adb298" "#adb298" "green"))
   (eg-green7   '("#a0a587" "#a0a587" "green"))
   (eg-green8   '("#929975" "#929975" "green"))
   (eg-green9   '("#858c64" "#858c64" "green"))

   (eg-red1     '("#f4efee" "#f4efee" "brightred"))
   (eg-red2     '("#e9dede" "#e9dede" "brightred"))
   (eg-red3     '("#dececd" "#dececd" "brightred"))
   (eg-red4     '("#d3bdbc" "#d3bdbc" "brightred"))
   (eg-red5     '("#c9adac" "#c9adac" "brightred"))
   (eg-red6     '("#be9c9b" "#be9c9b" "brightred"))
   (eg-red7     '("#b38c8a" "#b38c8a" "brightred"))
   (eg-red8     '("#a87b79" "#a87b79" "red"))
   (eg-red9     '("#9d6b69" "#9d6b69" "red"))

   (eg-berry1     '("#f7eef4" "#f7eef4" "brightmagenta"))
   (eg-berry2     '("#efdde8" "#efdde8" "brightmagenta"))
   (eg-berry3     '("#e6ccdd" "#e6ccdd" "brightmagenta"))
   (eg-berry4     '("#debbd1" "#debbd1" "brightmagenta"))
   (eg-berry5     '("#d6aac6" "#d6aac6" "brightmagenta"))
   (eg-berry6     '("#ce98bb" "#ce98bb" "brightmagenta"))
   (eg-berry7     '("#c687af" "#c687af" "brightmagenta"))
   (eg-berry8     '("#bd76a4" "#bd76a4" "brightmagenta"))
   (eg-berry9     '("#b56598" "#b56598" "brightmagenta"))

   (bg         eg-bg)
   (bg-alt     eg-bg2)
   (base0      (doom-lighten bg 0.1))
   (base1      eg-grey2)
   (base2      eg-grey3)
   (base3      eg-grey4)
   (base4      eg-grey5)
   (base5      eg-grey6)
   (base6      eg-grey7)
   (base7      eg-grey8)
   (base8      eg-fg2)
   (fg         eg-fg)
   (fg-alt     eg-grey8)

   (grey base5)
   (red       eg-red)
   (orange    eg-orange)
   (green     eg-green)
   (teal      eg-teal)
   (yellow    eg-orange)
   (blue      eg-blue)
   (dark-blue eg-blue)
   (magenta   eg-purple)
   (violet    eg-purple)
   (cyan      eg-teal)
   (dark-cyan eg-teal)

   ;; face categories -- required for all themes
   (highlight eg-blue8)
   (vertical-bar base2)
   (selection eg-purple4)
   (builtin fg)
   (comments (if doom-earl-grey-brighter-comments
                 eg-grey7
                 eg-grey6))
   (doc-comments comments)
   (constants teal)
   (functions fg)
   (keywords magenta)
   (methods fg)
   (operators fg)
   (type fg)
   (strings green)
   (variables blue)
   (numbers teal)
   (region eg-berry1)
   (error red)
   (warning yellow)
   (success green)
   (vc-modified eg-orange8)
   (vc-added eg-green8)
   (vc-deleted eg-red8)

   ;; custom categories
   (hidden `(,(car bg) "black" "black"))
   (-modeline-bright doom-earl-grey-brighter-modeline)
   (-modeline-pad
    (when doom-earl-grey-padded-modeline
      (if (integerp doom-earl-grey-padded-modeline)
          doom-earl-grey-padded-modeline 4)))

   (modeline-fg     'unspecified)
   (modeline-fg-alt eg-grey6)

   (modeline-bg
    (if -modeline-bright
        (doom-darken eg-bg2 0.1)
      eg-bg2))
   (modeline-bg-l
    (if -modeline-bright
        eg-bg2
      (doom-blend base1 fg 0.96)))
   (modeline-bg-inactive eg-bg2)
   (modeline-bg-inactive-l `(,(doom-darken (car eg-bg2) 0.05) ,@(cdr base1))))

  ;; --- extra faces ------------------------
  (
   ;; Modeline
   (doom-modeline-buffer-path       :foreground blue)
   (doom-modeline-buffer-major-mode :inherit 'doom-modeline-buffer-path
                                    :bold 'bold)
   (doom-modeline-info              :foreground green)
   (doom-modeline-project-dir       :foreground magenta)
   (doom-modeline-evil-insert-state :foreground teal)
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))
   (doom-modeline-project-root-dir :foreground base6)

   ;; solaire
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
    (font-lock-comment-delimiter-face    :inherit font-lock-comment-face)
    (font-lock-builtin-face              :foreground fg
                                         :inherit 'italic :extend t)
    (font-lock-type-face                 :foreground fg
                                         :inherit 'italic :extend t)
    (font-lock-variable-name-face        :foreground blue)
    (font-lock-warning-face              :foreground red)
    (font-lock-negation-char-face        :foreground orange
                                         :inherit 'default
                                         :extend t)
    (font-lock-preprocessor-face         :foreground orange
                                         :inherit 'default
                                         :extend t)
    (font-lock-preprocessor-char-face    :inherit 'default)
    (font-lock-regexp-grouping-backslash :inherit 'default)
    (font-lock-regexp-grouping-construct :inherit 'default)
    (font-lock-constant-face             :foreground teal)
    (font-lock-function-name-face        :foreground fg
                                         :inherit 'italic :extend t)

    ;; makefile-*-mode
    (makefile-targets :foreground magenta)
    (makefile-space :background eg-red2)
    (makefile-makepp-perl :background eg-blue1)

    ;; which-key
    (which-key-key-face                   :foreground eg-purple8)
    (which-key-group-description-face     :foreground eg-blue8)
    (which-key-command-description-face   :foreground fg)
    (which-key-local-map-description-face :foreground orange)
    (which-key-separator-face             :background bg-alt
                                          :foreground comments)

    ;; highlight-numbers-mode
    (highlight-numbers-number :foreground teal)

    ;; web-mode
    (web-mode-doctype-face           :foreground comments)
    (web-mode-html-tag-face          :foreground magenta)
    (web-mode-html-attr-name-face    :foreground blue)
    (web-mode-html-attr-value-face   :inherit 'font-lock-string-face)
    (web-mode-html-entity-face       :foreground orange
                                     :inherit 'italic)
    (web-mode-block-control-face     :foreground magenta)
    (web-mode-html-tag-bracket-face  :foreground fg-alt)
    (web-mode-symbol-face            :foreground blue)
    (web-mode-string-face            :inherit 'font-lock-string-face)
    (web-mode-current-element-highlight-face :foreground bg)

    ;; xml
    (nxml-element-local-name :foreground magenta)

    ;; ocaml
    (tuareg-font-lock-governing-face :foreground magenta)
    (tuareg-font-lock-operator-face :foreground orange)

    ;; haskell
    (haskell-constructor-face :foreground teal)
    (haskell-operator-face :foreground fg)
    ((haskell-type-face &override)
     :foreground blue
     :inherit 'font-lock-type-face
     :extend t)
    ((haskell-definition-face &override)
     :foreground magenta
     :inherit 'font-lock-function-name-face
     :extend t)

    ;; Highlight
    (lazy-highlight :foreground eg-fg2
                    :background eg-berry2 :inherit 'default :extend t)

    ;; php
    (php-$this :foreground orange)


    ;; rjsx-mode
    (rjsx-tag  :foreground magenta)
    (rjsx-text :inherit 'default)
    (rjsx-tag-bracket-face :foreground fg-alt)
    (rjsx-attr :foreground blue)

    ;; highlight-quoted-mode
    (highlight-quoted-symbol :foreground blue)
    (highlight-quoted-quote  :foreground teal)

    ;; rainbow-delimiters
    (rainbow-delimiters-depth-1-face :foreground eg-blue6)
    (rainbow-delimiters-depth-2-face :foreground eg-purple6)
    (rainbow-delimiters-depth-3-face :foreground eg-green6)
    (rainbow-delimiters-depth-4-face :foreground eg-orange6)
    (rainbow-delimiters-depth-5-face :foreground eg-teal6)
    (rainbow-delimiters-depth-6-face :foreground eg-blue6)
    (rainbow-delimiters-depth-7-face :foreground eg-purple6)
    (rainbow-delimiters-unmatched-face  :foreground red
                                        :weight 'bold
                                        :inverse-video t)
    (rainbow-delimiters-mismatched-face
     :inherit 'rainbow-delimiters-unmatched-face)

    ;; swiper
    (swiper-line-face    :background  eg-purple2
                         :foreground fg
                         :weight 'semi-bold)
    (swiper-match-face-1 :inherit 'unspecified
                         :background  eg-purple1
                         :foreground fg)
    (swiper-background-match-face-1 :inherit 'unspecified
                         :background  eg-bg2
                         :foreground fg)
    (swiper-match-face-2 :inherit 'unspecified
                         :background eg-purple1
                         :foreground eg-purple)
    (swiper-background-match-face-2 :inherit 'unspecified
                         :background eg-purple1
                         :foreground eg-purple
                         :weight 'semi-bold)
    (swiper-match-face-3 :inherit 'unspecified
                         :background eg-blue1
                         :foreground blue)
    (swiper-background-match-face-3 :inherit 'unspecified
                         :background eg-blue1
                         :foreground blue
                         :weight 'semi-bold)
    (swiper-match-face-4 :inherit 'unspecified
                         :background eg-teal1
                         :foreground teal)
    (swiper-background-match-face-4 :inherit 'unspecified
                         :background eg-teal1
                         :foreground teal
                         :weight 'semi-bold)

    ;; tooltip
    (tooltip :background bg-alt :foreground fg)

    ;; company
    (company-tooltip            :inherit 'tooltip)
    (company-tooltip-annotation            :foreground magenta)
    (company-tooltip-annotation-selection  :foreground magenta )
    (company-tooltip-common                :foreground magenta
                                           :distant-foreground bg-alt
                                           :weight 'bold)
    (company-tooltip-search     :background magenta
                                :foreground bg
                                :distant-foreground fg
                                :weight 'bold)
    (company-tooltip-search-selection :background eg-purple1)
    (company-tooltip-selection  :background eg-purple1
                                :weight 'bold)
    (company-tooltip-mouse      :background eg-purple8
                                :foreground bg
                                :distant-foreground fg)
    (company-tooltip-annotation :foreground magenta
                                :distant-foreground bg)
    (company-scrollbar-bg       :inherit 'tooltip)
    (company-scrollbar-fg       :background highlight)
    (company-preview            :foreground comments)
    (company-preview-common     :background base3
                                :foreground highlight)
    (company-preview-search     :inherit 'company-tooltip-search)
    (company-template-field     :inherit 'match)
    (company-echo-common        :background eg-red2
                                :foreground fg)

    ;; company-box
    (company-box-candidate :foreground fg)

   ((region &override)
    :foreground fg)

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground base6)
   ((paren-face-match &override) :foreground red :background eg-grey1 :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base3 :background red :weight 'ultra-bold)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override) :foreground teal)

   ;; parens
   ((show-paren-match &override)
    :background eg-grey1)

   ;; elscreen
   (elscreen-tab-other-screen-face :background bg-alt :foreground fg)

   ;; Magit / Diff
   (magit-diff-hunk-heading-highlight :foreground bg :background eg-blue8 :weight 'bold)
   (magit-diff-hunk-heading :foreground bg :background eg-blue5)
   (magit-blame-heading     :foreground magenta
                            :background eg-grey1 :extend t)
   (magit-blame-date       :foreground blue)

   (magit-diff-removed :background eg-red1
                       :foreground eg-red)
   (magit-diff-removed-highlight :background eg-red3
                                 :foreground eg-red)
   (diff-refine-removed :background eg-red9
                        :foreground eg-red1)

   (magit-diff-added :background eg-green1
                     :foreground eg-green)
   (magit-diff-added-highlight :background eg-green3
                               :foreground eg-green)
   (diff-refine-added :background eg-green
                      :foreground bg)

   (diff-refine-changed :background eg-purple9
                        :foreground bg)

   (git-commit-summary :foreground fg)


   ;; Dired
   (diredfl-date-time    :foreground blue)
   (diredfl-dir-heading  :foreground magenta :weight 'bold)

   ;; ivy
   (ivy-posframe :background eg-blue1)
   (ivy-virtual :foreground eg-blue8)
   (ivy-cursor :foreground bg-alt
               :background fg)
   (ivy-minibuffer-match-face-1
    :background nil
    :foreground comments
    :weight 'semi-bold)
    (ivy-minibuffer-match-face-2
     :inherit 'ivy-minibuffer-match-face-1
     :foreground eg-purple :background eg-purple1)
    (ivy-minibuffer-match-face-3
     :inherit 'ivy-minibuffer-match-face-2
     :foreground blue :background eg-orange1)
    (ivy-minibuffer-match-face-4
     :inherit 'ivy-minibuffer-match-face-2
     :foreground teal :background eg-teal1)

   (internal-border
    :foreground eg-blue8
    :background eg-blue1)
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-property             :foreground blue
                             :inherit 'italic)
   (css-proprietary-property :foreground orange)
   (css-selector             :foreground magenta)
   (web-mode-css-property-name-face :foreground fg)

   ;; markdown-mode
   (markdown-header-face           :inherit 'bold
                                   :foreground magenta)
   (markdown-header-delimiter-face :inherit 'markdown-header-face)
   (markdown-metadata-key-face     :foreground green)
   (markdown-list-face             :foreground fg
                                   :inherit 'bold)
   (markdown-link-face             :foreground teal)
   (markdown-url-face              :foreground blue)
   (markdown-italic-face           :inherit 'italic
                                   :foreground fg)
   (markdown-bold-face             :inherit 'bold
                                   :foreground fg)
   (markdown-markup-face           :foreground fg
                                   :inherit 'bold)
   (markdown-blockquote-face       :inherit 'italic
                                   :foreground orange)
   (markdown-pre-face              :foreground orange
                                   :extend t)
   (markdown-code-face             :foreground orange
                                   :extend t)
   (markdown-reference-face        :foreground blue)
   (markdown-inline-code-face      :inherit '(markdown-code-face markdown-pre-face)
                                   :extend nil)
   (markdown-html-attr-name-face     :inherit 'font-lock-variable-name-face)
   (markdown-html-attr-value-face    :inherit 'font-lock-string-face)
   (markdown-html-entity-face        :inherit 'font-lock-variable-name-face)
   (markdown-html-tag-delimiter-face :inherit 'default)
   (markdown-html-tag-name-face      :inherit 'font-lock-keyword-face)

   (nav-flash-face :background eg-purple1 :foreground fg :weight 'bold)

   ;; org-mode
   ((outline-1 &override) :foreground magenta)
   ((outline-2 &override) :foreground red)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground orange)
   ((outline-5 &override) :foreground magenta)
   ((outline-6 &override) :foreground red)
   ((outline-7 &override) :foreground teal)
   ((outline-8 &override) :foreground orange)

   (org-drawer  :foreground eg-orange)
   (org-ellipsis :underline nil :background bg     :foreground red)
   ((org-block-begin-line &override)
    :foreground orange
    :background bg-alt
    :weight 'semi-bold
    :extend t)
   ((org-block &override)
    :background bg-alt
    :foreground fg
    :extend t)
   ((org-quote &override)
    :foreground orange
    :background bg-alt
    :extend t)
   ((org-document-title &override)
    :foreground magenta)

   ;; js2-mode
   (js2-function-param    :foreground blue)
   (js2-function-call     :foreground fg :inherit 'italic)
   (js2-object-property   :foreground fg)
   (js2-jsdoc-tag         :foreground doc-comments)
   (js2-external-variable :foreground fg)

   ;; racket
   (racket-keyword-argument-face :foreground orange)
   (racket-selfeval-face :foreground teal)
   (racket-debug-break-face :foreground bg :background red)

   ;; clojure
   (clojure-keyword-face :foreground blue)

   ;; elixir
   (elixir-atom-face :foreground blue)
   (elixir-attribute-face :foreground teal)

   ;; lsp
   (lsp-ui-doc-background      :background bg-alt)
   (lsp-face-highlight-read    :inherit 'lazy-highlight)
   (lsp-face-highlight-textual :inherit 'lsp-face-highlight-read)
   (lsp-face-highlight-write   :inherit 'lsp-face-highlight-read)

   ;; doom dashboard
   (doom-dashboard-banner      :foreground eg-grey5)
   (doom-dashboard-menu-title  :foreground eg-purple8)
   (doom-dashboard-menu-desc   :foreground eg-green8)
   (doom-dashboard-footer-icon :foreground eg-orange8)
   (doom-dashboard-loaded      :foreground eg-blue8)

   ;; evil-snipe
   (evil-snipe-first-match-face :foreground bg :background blue)

   ;; End
   )

  ;; --- extra variables ---------------------
  ()
  )

;;; doom-earl-grey-theme.el ends here

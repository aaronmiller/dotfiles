;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq! doom-font (font-spec :family "Hack Nerd Font Mono" :size 12)
       doom-symbol-font (font-spec :family "Symbols Nerd Font Mono")
       doom-variable-pitch-font (font-spec :family "Hack Nerd Font Mono"))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq! doom-theme 'my-doom-nord-aurora)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq! display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq! org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(toggle-frame-fullscreen)

(setq! frame-title-format "\n"
       fringe-mode 4
       mouse-wheel-flip-direction t
       mouse-wheel-scroll-amount '(1 ((shift) . hscroll))
       mouse-wheel-scroll-amount-horizontal 1
       mouse-wheel-tilt-scroll t
       ns-right-alternate-modifier 'meta
       ns-use-native-fullscreen t
       scroll-preserve-screen-position nil
       sh-indent-after-done 2
       sh-indent-for-do 2
       sh-indent-for-done 2
       sh-indent-for-else 2
       sh-indent-for-fi 2
       sh-indent-for-then 2
       sh-indentation 2
       text-scale-mode-step 1)

(custom-set-variables
 '(warning-suppress-log-types '((transient) (transient) (defvaralias)))
 '(warning-suppress-types '((transient) (defvaralias))))

(custom-set-faces!
  '(line-number :height 0.8 :weight bold :background nil)
  '(line-number-current-line :height 0.8 :weight bold :background nil))

(global-set-key (kbd "M-s-;") #'+workspace/switch-right)
(global-set-key (kbd "M-s-<left>") #'previous-buffer)
(global-set-key (kbd "M-s-<right>") #'next-buffer)
(global-set-key (kbd "M-s-l") #'+workspace/switch-left)
(global-set-key (kbd "s-'") #'+vterm/toggle)
(global-set-key (kbd "s-0") #'doom/reset-font-size)
(global-set-key (kbd "s-1") #'+workspace/switch-to-0)
(global-set-key (kbd "s-2") #'+workspace/switch-to-1)
(global-set-key (kbd "s-3") #'+workspace/switch-to-2)
(global-set-key (kbd "s-4") #'+workspace/switch-to-3)
(global-set-key (kbd "s-5") #'+workspace/switch-to-4)
(global-set-key (kbd "s-6") #'+workspace/switch-to-5)
(global-set-key (kbd "s-7") #'+workspace/switch-to-6)
(global-set-key (kbd "s-8") #'+workspace/switch-to-7)
(global-set-key (kbd "s-9") #'+workspace/switch-to-final)
(global-set-key (kbd "s-<down>") #'evil-goto-line)
(global-set-key (kbd "s-<return>") #'toggle-frame-fullscreen)
(global-set-key (kbd "s-<up>") #'evil-goto-first-line)
(global-set-key (kbd "s-D") #'+evil/window-split-and-follow)
(global-set-key (kbd "s-\\") #'treemacs-select-window)
(global-set-key (kbd "s-d") #'+evil/window-vsplit-and-follow)

(map! :nvie "s-0" #'doom/reset-font-size
      :nvie "s-1" #'+workspace/switch-to-0
      :nvie "s-2" #'+workspace/switch-to-1
      :nvie "s-3" #'+workspace/switch-to-2
      :nvie "s-4" #'+workspace/switch-to-3
      :nvie "s-5" #'+workspace/switch-to-4
      :nvie "s-6" #'+workspace/switch-to-5
      :nvie "s-7" #'+workspace/switch-to-6
      :nvie "s-8" #'+workspace/switch-to-7
      :nvie "s-9" #'+workspace/switch-to-final
      :nvie "s-<return>" #'toggle-frame-fullscreen)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(use-package! company
  :config
  (setq! company-idle-delay 0
         company-minimum-prefix-length 1))

(use-package! consult
  :custom-face
  (consult-line-number ((t (:height 0.8 :weight bold))))
  (consult-line-number-wrapped ((t (:height 0.8 :weight bold)))))

(use-package! deft
  :config
  (setq! deft-new-file-format "%Y-%m-%d"))

(use-package! doom
  :config
  (setq! doom-big-font-increment 1
         doom-font-increment 1)

  (add-hook! '+doom-dashboard-functions
    (hide-mode-line-mode)
    (hl-line-mode -1))

  (remove-hook! '+doom-dashboard-functions
    #'doom-dashboard-widget-banner
    #'doom-dashboard-widget-loaded)

  (setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil)))

(use-package! doom-modeline
  :config
  (setq! doom-modeline-hud t
         doom-modeline-modal nil
         doom-modeline-vcs-max-length 100)

  (remove-hook! 'doom-modeline-mode-hook
    #'size-indication-mode)
  (line-number-mode -1))

(use-package! doom-themes
  :config
  (setq! doom-themes-enable-italic nil
         doom-themes-padded-modeline t))

(use-package! evil
  :config
  (setq! evil-emacs-state-cursor '(bar)
         evil-escape-key-sequence nil))

(use-package! flycheck
  :config
  (setq! flycheck-clang-definitions '("_POSIX_C_SOURCE=200112L")
         flycheck-clang-language-standard "c89"))

(use-package! highlight-indent-guides
  :hook
  ((prog-mode text-mode conf-mode) . (lambda ()
                                       (highlight-indent-guides-mode)
                                       (highlight-indent-guides-mode))))

(use-package! hl-todo
  :config
  (setq! hl-todo-keyword-faces (apply 'append hl-todo-keyword-faces nil
                                      '(("HOLD" . "#d0bf8f")
                                        ("NEXT" . "#dca3a3")
                                        ("OK" . "#a3be8c")
                                        ("FAIL" . "#bf616a")
                                        ("DONE" . "#afd8af")
                                        ("MAYBE" . "#d0bf8f")
                                        ("KLUDGE" . "#d0bf8f")
                                        ("TEMP" . "#d0bf8f")) nil)))

(use-package! jinja2-mode
  :hook
  (jinja2-mode . toggle-truncate-lines))

(use-package! magit
  :config
  (setq! magit-log-section-commit-count 25
         magit-todos-insert-after '(bottom)))

(use-package! projectile
  :config
  (setq! projectile-auto-discover t
         projectile-project-search-path (apply 'append projectile-project-search-path nil '("~/" "~/devtools/") nil))

  (add-hook! 'projectile-after-switch-project-hook #'treemacs-find-file))

(use-package! recentf
  :config
  (add-to-list 'recentf-exclude "\\.emacs\\.d/\\.local/etc/workspaces/autosave"))

(use-package! treemacs
  :custom-face
  (treemacs-root-face ((t (:height 1.0))))
  :defer t
  :config
  (progn
    (setq! treemacs-fringe-indicator-mode nil
           treemacs-user-mode-line-format 'none
           treemacs-width 60
           treemacs-width-is-initially-locked nil))

  ;; HACK: This resets the default theme when treemacs initializes.
  (treemacs-create-theme "Default")
  (treemacs-load-theme "simple")
  (treemacs-follow-mode t)

  (map! :map treemacs-mode-map
        "s-\\" (cmd!
                (treemacs-visit-node-no-split)
                (+treemacs/toggle)))

  (after! solaire-mode
    (setq! solaire-mode-real-buffer-fn (lambda ()
                                         (buffer-name (buffer-base-buffer)) " *Treemacs-*"))))

(use-package! vterm
  :custom
  (vterm-always-compile-module t)
  :hook
  (vterm-mode . evil-emacs-state)
  :config
  (setq! vterm-max-scrollback 100000)

  (map! :map vterm-mode-map
        "M-<left>" (cmd! (vterm-send-key "\x62" nil t))
        "M-<right>" (cmd! (vterm-send-key "\x66" nil t))
        "s-<backspace>" (cmd! (vterm-send-key "\x15"))
        "s-<left>" (cmd! (vterm-send-key "\x61" nil nil t))
        "s-<right>" (cmd! (vterm-send-key "\x65" nil nil t))))

(use-package! yaml-mode
  :hook
  (yaml-mode . toggle-truncate-lines))

(use-package! yasnippet
  :config
  (setq! yas-snippet-dirs (apply 'append yas-snippet-dirs nil
                                 '("~/.doom.d/snippets") nil)))

;; Custom functions
(load! (concat (getenv "DOTFILES_DIR") "/.doom.d/functions"))

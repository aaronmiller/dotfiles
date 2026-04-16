;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. CORE PERFORMANCE & DISPLAY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Native compilation & process settings
(setq! native-comp-async-report-warnings-errors 'silent
       native-comp-speed 3)

;; High-performance rendering & macOS behavior
(setq-default bidi-display-reordering nil
              bidi-paragraph-direction 'left-to-right
              fast-but-imprecise-scrolling t
              frame-title-format "\n"
              idle-update-delay 1.0
              inhibit-compacting-font-caches t
              jit-lock-chunk-size 4096
              ns-right-alternate-modifier 'meta
              ns-use-native-fullscreen t
              read-process-output-max (* 1024 1024)
              redisplay-dont-pause t
              scroll-conservatively 101
              scroll-margin 0)

;; Garbage Collection Magic Hack (GCMH)
(after! gcmh
  (setq! gcmh-high-cons-threshold (* 32 1024 1024)
         gcmh-idle-delay 5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. LSP & COMPLETION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Eglot optimizations & emacs-lsp-booster wrapper
(after! eglot
  (setq! eglot-events-buffer-size 0)
  (fset #'jsonrpc--log-event #'ignore)
  (defun +eglot-lsp-booster--advice-jsonrpc-parse (old-fn &rest args)
    (if-let ((booster-path (executable-find "emacs-lsp-booster")))
        (let ((command (car args)))
          (apply old-fn (cons (append (list booster-path "raw") command) (cdr args))))
      (apply old-fn args)))
  (advice-add 'eglot--executable-command :around #'+eglot-lsp-booster--advice-jsonrpc-parse))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. UI & PACKAGE LOGIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Modeline & Line Number visuals
(setq! display-line-numbers-type 'relative
       doom-modeline-buffer-file-name-style 'file-name
       doom-modeline-enable-word-count nil
       doom-modeline-hud t
       doom-modeline-modal-modern-icon nil
       doom-modeline-vcs-max-length 12
       doom-themes-padded-modeline t)

;; Package-specific settings
(use-package! deft
  :config (setq! deft-new-file-format "%Y-%m-%d"))

(use-package! magit
  :config (setq! magit-log-section-commit-count 25
                 magit-refresh-status-buffer nil))

(use-package! projectile
  :config (setq! projectile-auto-discover t
                 projectile-enable-caching t
                 projectile-project-search-path '("~/devtools" "~/dotfiles")))

(use-package! py-isort
  :hook (before-save . py-isort-before-save))

(use-package! treemacs
  :defer t
  :config (setq! treemacs-git-mode -1
                 treemacs-recenter-after-file-follow t
                 treemacs-space-between-root-nodes nil
                 treemacs-width 64
                 treemacs-width-is-initially-locked nil
                 treemacs-user-mode-line-format 'none)
  (treemacs-load-theme "simple")
  (treemacs-follow-mode t))

(use-package! writeroom-mode
  :config (setq! writeroom-width 120))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. CUSTOM HOOKS & AUTOMATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Optimization for files > 1MB
(defun my-optimize-large-files-h ()
  (when (> (buffer-size) (* 1024 1024))
    (setq-local display-line-numbers nil font-lock-mode nil)))

;; Hook applications
(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode) (hl-line-mode -1))
(add-hook! '(prog-mode-hook conf-mode-hook text-mode-hook) #'display-line-numbers-mode)
(add-hook! '(yaml-mode-hook jinja2-mode-hook) #'toggle-truncate-lines)
(add-hook! 'before-save-hook #'whitespace-cleanup)
(add-hook! 'find-file-hook #'my-optimize-large-files-h)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)
(add-hook! 'projectile-after-switch-project-hook #'treemacs-find-file)

;; Dashboard aesthetics: Hide modeline and cursor for a clean splash screen
(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-banner
  #'doom-dashboard-widget-footer
  #'doom-dashboard-widget-loaded)

(add-hook! '+doom-dashboard-functions
  (setq mode-line-format nil
        cursor-type nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. KEYBINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Universal bindings (Priority Maps)
(map! :map 'override :gniv "s-<return>" #'toggle-frame-fullscreen)

;; Global custom shortcuts
(map! "M-s-;" #'+workspace/switch-right
      "M-s-<left>" #'previous-buffer
      "M-s-<right>" #'next-buffer
      "M-s-l" #'+workspace/switch-left
      "s-D"  #'+evil/window-split-and-follow
      "s-\\" #'+treemacs/toggle
      "s-d"  #'+evil/window-vsplit-and-follow
      :nvie "s-0" #'doom/reset-font-size
      :nvie "s-1" #'+workspace/switch-to-0
      :nvie "s-2" #'+workspace/switch-to-1
      :nvie "s-3" #'+workspace/switch-to-2
      :nvie "s-4" #'+workspace/switch-to-3
      :nvie "s-5" #'+workspace/switch-to-4
      :nvie "s-6" #'+workspace/switch-to-5
      :nvie "s-7" #'+workspace/switch-to-6
      :nvie "s-8" #'+workspace/switch-to-7
      :nvie "s-9" #'+workspace/switch-to-final)

;; Font-specific face customizations
(custom-set-faces
 '(line-number ((t (:height 0.8 :weight bold))))
 '(line-number-current-line ((t (:height 0.8 :weight bold))))
 '(treemacs-root-face ((t (:height 1.0)))))

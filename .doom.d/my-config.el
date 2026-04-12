;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. EXTREME PERFORMANCE (Emacs 30 Internal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq! native-comp-async-report-warnings-errors 'silent
       native-comp-speed 3)

(setq-default bidi-display-reordering nil
              fast-but-imprecise-scrolling t
              frame-title-format "\n"
              idle-update-delay 1.0
              inhibit-compacting-font-caches t
              ns-right-alternate-modifier 'meta
              ns-use-native-fullscreen t
              read-process-output-max (* 1024 1024)
              redisplay-dont-pause t
              scroll-conservatively 101
              scroll-margin 0)

(after! gcmh
  (setq! gcmh-high-cons-threshold (* 32 1024 1024)
         gcmh-idle-delay 5))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. LSP BOOSTER (Eglot Wrapper)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(after! eglot
  (setq! eglot-events-buffer-size 0)
  (fset #'jsonrpc--log-event #'ignore)

  (defun +eglot-lsp-booster--advice-jsonrpc-parse (old-fn &rest args)
    "Use emacs-lsp-booster for faster JSON to bytecode conversion."
    (if-let ((booster-path (executable-find "emacs-lsp-booster")))
        (let ((command (car args)))
          (apply old-fn (cons (append (list booster-path "raw") command) (cdr args))))
      (apply old-fn args)))
  (advice-add 'eglot--executable-command :around #'+eglot-lsp-booster--advice-jsonrpc-parse))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. UI, VISUALS & PACKAGE LOGIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq! display-line-numbers-type 'relative
       doom-modeline-buffer-file-name-style 'file-name
       doom-modeline-enable-word-count nil
       doom-modeline-hud t
       doom-modeline-vcs-max-length 12
       doom-themes-padded-modeline t)

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
                 treemacs-width 64
                 treemacs-user-mode-line-format 'none)
  (treemacs-create-theme "Default")
  (treemacs-load-theme "simple")
  (treemacs-follow-mode t))

(use-package! vterm
  :config (setq! vterm-max-scrollback 5000))

(use-package! writeroom-mode
  :config (setq! writeroom-width 120))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. CUSTOM HOOKS & LOGIC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-optimize-large-files-h ()
  "Emergency performance brake for files > 1MB."
  (when (> (buffer-size) (* 1024 1024))
    (display-line-numbers-mode -1)
    (font-lock-mode -1)
    (git-gutter-mode -1)))

(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode) (hl-line-mode -1))
(add-hook! '(prog-mode-hook conf-mode-hook text-mode-hook) #'display-line-numbers-mode)
(add-hook! '(yaml-mode-hook jinja2-mode-hook) #'toggle-truncate-lines)
(add-hook! 'before-save-hook #'whitespace-cleanup)
(add-hook! 'find-file-hook #'my-optimize-large-files-h)
(add-hook! 'python-mode-hook #'python-black-on-save-mode)
(add-hook! 'vterm-mode-hook #'evil-emacs-state)

(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-banner
  #'doom-dashboard-widget-footer
  #'doom-dashboard-widget-loaded)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. KEYBINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Universal bindings (Priority Maps)
(map! :map 'override :gniv "s-<return>" #'toggle-frame-fullscreen)

;; Custom Keymap
(map! "s-'"  #'+vterm/toggle
      "s-\\" #'+treemacs/toggle
      "s-d"  #'+evil/window-vsplit-and-follow
      "s-D"  #'+evil/window-split-and-follow
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

(custom-set-faces
 '(line-number ((t (:height 0.8 :weight bold))))
 '(line-number-current-line ((t (:height 0.8 :weight bold))))
 '(treemacs-root-face ((t (:height 1.0)))))

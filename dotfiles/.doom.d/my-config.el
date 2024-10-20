;;; my-config.el -*- lexical-binding: t; -*-

(setq-default frame-title-format "\n"
              mouse-wheel-flip-direction t
              mouse-wheel-tilt-scroll t
              ns-right-alternate-modifier 'meta
              ns-use-native-fullscreen t)

(after! gcmh
  (setopt gcmh-high-cons-threshold (* 32 1024 1024)
          gcmh-idle-delay 5))

(setopt doom-modeline-buffer-file-name-style 'file-name
        doom-modeline-enable-word-count nil
        doom-modeline-hud t
        doom-modeline-modal-modern-icon nil
        doom-modeline-vcs-max-length 12
        doom-themes-padded-modeline t)

(after! deft
  (setopt deft-new-file-format "%Y-%m-%d"))

(after! magit
  (setopt magit-log-section-commit-count 25
          magit-refresh-status-buffer nil))

(after! projectile
  (setopt projectile-auto-discover t
          projectile-enable-caching t
          projectile-project-search-path '("~/devtools" "~/dotfiles")))

(after! treemacs
  (setopt treemacs-recenter-after-file-follow 'always
          treemacs-git-mode nil
          treemacs-space-between-root-nodes nil
          treemacs-width 64
          treemacs-width-is-initially-locked nil
          treemacs-user-mode-line-format 'none)
  (treemacs-load-theme "simple")
  (treemacs-follow-mode 1))

(defun my-optimize-large-files-h ()
  (when (> (buffer-size) (* 1024 1024))
    (setq-local display-line-numbers nil font-lock-mode nil)))

(add-hook! '(prog-mode-hook conf-mode-hook text-mode-hook) #'display-line-numbers-mode)
(add-hook! 'before-save-hook #'whitespace-cleanup)
(add-hook! 'find-file-hook #'my-optimize-large-files-h)
(add-hook! 'projectile-after-switch-project-hook #'treemacs-find-file)

(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-banner
  #'doom-dashboard-widget-footer
  #'doom-dashboard-widget-loaded)

(map! :map 'override :gniv "s-<return>" #'toggle-frame-fullscreen)

(map! "M-s-;"       #'+workspace/switch-right
      "M-s-<left>"  #'previous-buffer
      "M-s-<right>" #'next-buffer
      "M-s-l"       #'+workspace/switch-left
      "s-D"         #'+evil/window-split-and-follow
      "s-\\"        #'+treemacs/toggle
      "s-d"         #'+evil/window-vsplit-and-follow
      :nvie "s-0"   #'doom/reset-font-size
      :nvie "s-1"   #'+workspace/switch-to-0
      :nvie "s-2"   #'+workspace/switch-to-1
      :nvie "s-3"   #'+workspace/switch-to-2
      :nvie "s-4"   #'+workspace/switch-to-3
      :nvie "s-5"   #'+workspace/switch-to-4
      :nvie "s-6"   #'+workspace/switch-to-5
      :nvie "s-7"   #'+workspace/switch-to-6
      :nvie "s-8"   #'+workspace/switch-to-7
      :nvie "s-9"   #'+workspace/switch-to-final)

(defun my-apply-custom-faces-h ()
  (custom-set-faces
   '(line-number ((t (:height 0.8 :weight bold))))
   '(line-number-current-line ((t (:height 0.8 :weight bold))))
   '(treemacs-root-face ((t (:height 1.0))))))

(my-apply-custom-faces-h)
(add-hook! 'doom-load-theme-hook #'my-apply-custom-faces-h)

(when (eq system-type 'darwin)
  (let ((nix-paths '("/nix/var/nix/profiles/default/bin"
                     "/run/current-system/sw/bin"
                     "~/.nix-profile/bin"
                     "/usr/local/bin")))
    (dolist (path nix-paths)
      (let ((expanded-path (expand-file-name path)))
        (when (and (file-directory-p expanded-path)
                   (not (member expanded-path exec-path)))
          (setenv "PATH" (concat expanded-path ":" (getenv "PATH")))
          (push expanded-path exec-path))))))

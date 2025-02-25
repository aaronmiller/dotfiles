;;; $DOOMDIR/my-config.el -*- lexical-binding: t; -*-

(use-package! consult
  :custom-face
  (consult-line-number ((t (:height 0.8 :weight bold))))
  (consult-line-number-wrapped ((t (:height 0.8 :weight bold)))))

(use-package! corfu
  :init
  (global-corfu-mode))

(use-package! deft
  :config
  (setq! deft-new-file-format "%Y-%m-%d"))

(use-package! doom
  :config
  (setq! doom-big-font-increment 1
         doom-font-increment 1))

(use-package! doom-modeline
  :config
  (setq! doom-modeline-hud t
         doom-modeline-modal-modern-icon nil
         doom-modeline-vcs-max-length 100))

(use-package! doom-themes
  :config
  (setq! doom-themes-enable-italic nil
         doom-themes-padded-modeline t))

(use-package! emacs
  :config
  (toggle-frame-fullscreen)

  (setq! explicit-shell-file-name "/bin/bash"
         frame-title-format "\n"
         gc-cons-threshold (* 100 1024 1024)
         mouse-wheel-flip-direction t
         mouse-wheel-tilt-scroll t
         ns-right-alternate-modifier 'meta
         ns-use-native-fullscreen t
         sh-indentation 2
         text-scale-mode-step 1
         tramp-allow-unsafe-temporary-files t
         tramp-use-ssh-controlmaster-options nil
         warning-suppress-log-types '((transient) (transient) (defvaralias))
         warning-suppress-types '((transient) (defvaralias)))

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

  :custom
  ;; corfu
  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p)

  :custom-face
  (line-number ((t (:height 0.8 :weight bold))))
  (line-number-current-line ((t (:height 0.8 :weight bold)))))

(use-package! eglot
  :config
  (setq! eglot-connect-timeout nil))

(use-package! evil
  :config
  (setq! evil-emacs-state-cursor '(bar)
         evil-escape-key-sequence nil))

(use-package! magit
  :config
  (setq! magit-git-executable "/Applications/Xcode.app/Contents/Developer/usr/bin/git"
         magit-log-section-commit-count 25
         magit-todos-insert-after '(bottom)))

(use-package! projectile
  :config
  (setq! projectile-auto-discover t
         projectile-file-exists-remote-cache-expire nil
         projectile-project-search-path (apply 'append projectile-project-search-path nil '("~/" "~/devtools/") nil)))

(use-package! recentf
  :config
  (add-to-list 'recentf-exclude "\\.emacs\\.d/\\.local/etc/workspaces/autosave"))

(use-package! shfmt
  :config
  (setq! shfmt-arguments '("-i" "2")))

(use-package! treemacs
  :custom-face
  (treemacs-root-face ((t (:height 1.0))))
  :defer t
  :config
  (progn
    (setq! treemacs-git-mode -1
           treemacs-recenter-after-file-follow t
           treemacs-space-between-root-nodes nil
           treemacs-user-mode-line-format 'none
           treemacs-width 52
           treemacs-width-is-initially-locked nil))

  ;; HACK: This resets the default theme when treemacs initializes.
  (treemacs-create-theme "Default")
  (treemacs-load-theme "simple")

  (treemacs-follow-mode t)

  (map! :map treemacs-mode-map
        "s-\\" (cmd!
                (treemacs-visit-node-no-split)
                (+treemacs/toggle))))

(use-package! vterm
  :config
  (setq! vterm-ignore-blink-cursor nil
         vterm-max-scrollback 100000
         vterm-module-cmake-args "-DUSE_SYSTEM_LIBVTERM=no")

  (map! :map vterm-mode-map
        "M-<left>" (cmd! (vterm-send-key "\x62" nil t))
        "M-<right>" (cmd! (vterm-send-key "\x66" nil t))
        "s-<backspace>" (cmd! (vterm-send-key "\x15"))
        "s-<left>" (cmd! (vterm-send-key "\x61" nil nil t))
        "s-<right>" (cmd! (vterm-send-key "\x65" nil nil t)))

  :custom
  (vterm-always-compile-module t))

(use-package! writeroom-mode
  :config
  (setq! writeroom-width 120))

;; Hooks
(load! (concat (getenv "DOTFILES_DIR") "/.doom.d/hooks"))

;; Custom functions
(load! (concat (getenv "DOTFILES_DIR") "/.doom.d/functions"))

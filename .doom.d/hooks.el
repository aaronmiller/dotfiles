;;; $DOOMDIR/hooks.el -*- lexical-binding: t; -*-

(add-hook 'python-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'py-isort-buffer nil t)))

(add-hook! '(conf-mode-hook prog-mode-hook))

(add-hook! '+doom-dashboard-functions
  (hide-mode-line-mode)
  (hl-line-mode -1))

(add-hook! 'c-mode-common-hook #'google-set-c-style)
(add-hook! 'jinja2-mode-hook #'toggle-truncate-lines)
(add-hook! 'projectile-after-switch-project-hook #'treemacs-find-file)
(add-hook! 'sh-mode-hook #'shfmt-on-save-mode)
(add-hook! 'vterm-mode-hook #'evil-emacs-state)
(add-hook! 'yaml-mode-hook #'toggle-truncate-lines)

(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-banner
  #'doom-dashboard-widget-footer
  #'doom-dashboard-widget-loaded)

(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))

;;; $DOOMDIR/hooks.el -*- lexical-binding: t; -*-

(add-hook! 'c-mode-common-hook #'google-set-c-style)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `((c++-mode c-mode) . ,(eglot-alternatives
                                       '(("clangd-8"))))))

(add-hook 'python-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'py-isort-buffer nil t)))

(add-hook! 'jinja2-mode-hook #'toggle-truncate-lines)
(add-hook! 'projectile-after-switch-project-hook #'treemacs-find-file)
(add-hook! 'sh-mode-hook #'shfmt-on-save-mode)

(add-hook! '(conf-mode-hook prog-mode-hook))

(add-hook! 'vterm-mode-hook #'evil-emacs-state)
(add-hook! 'yaml-mode-hook #'toggle-truncate-lines)

(add-hook! '+doom-dashboard-functions
  (hide-mode-line-mode)
  (hl-line-mode -1))

(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-banner
  #'doom-dashboard-widget-loaded)

(remove-hook! 'doom-modeline-mode-hook
  #'size-indication-mode)

(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))

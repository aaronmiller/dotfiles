;;; $DOOMDIR/hooks.el -*- lexical-binding: t; -*-

(defun disable-line-numbers-hook ()
  (display-line-numbers-mode 0))

(add-hook! '(conf-mode-hook prog-mode-hook))

(add-hook! '+doom-dashboard-functions
  (hide-mode-line-mode)
  (hl-line-mode -1))

(add-hook! 'LaTeX-mode-hook
  (lambda ()
    (xenops-mode)
    (prettify-symbols-mode -1)))

(add-hook! 'before-save-hook #'whitespace-cleanup)
(add-hook! 'c-mode-common-hook #'google-set-c-style)
(add-hook! 'help-mode-hook #'disable-line-numbers-hook)
(add-hook! 'jinja2-mode-hook #'toggle-truncate-lines)
(add-hook! 'magit-status-mode-hook #'disable-line-numbers-hook)
(add-hook! 'projectile-after-switch-project-hook #'demap-toggle)
(add-hook! 'projectile-after-switch-project-hook #'treemacs-find-file)

(add-hook! 'prog-mode-hook
  (lambda ()
    (when (boundp 'eglot-mode)
      (eglot-mode -1))
    (eglot-shutdown)))

(add-hook! 'treemacs-mode-hook #'disable-line-numbers-hook)
(add-hook! 'vterm-mode-hook #'disable-line-numbers-hook)
(add-hook! 'vterm-mode-hook #'evil-emacs-state)
(add-hook! 'yaml-mode-hook #'toggle-truncate-lines)

(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-banner
  #'doom-dashboard-widget-footer
  #'doom-dashboard-widget-loaded)

(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))

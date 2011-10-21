
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

(setq scheme-program-name "guile")
(load (concat emacs-root "site-lisp/geiser/elisp/geiser-load"))

(add-hook 'emacs-lisp-mode-hook
          'mine-default-lisp-settings)

(add-hook 'lisp-mode-hook
          'mine-default-lisp-settings)

(add-hook 'lisp-interaction-mode-hook
          'mine-default-lisp-settings)

(add-hook 'ielm-mode-hook
          'mine-default-lisp-settings)

(defun mine-default-lisp-settings ()
  "Configure default settings for a LISP environment"
  (paredit-mode +1)
  (turn-on-eldoc-mode)
  (eldoc-add-command 'paredit-backward-delete 'paredit-close-round))

(provide 'mine-lisp)

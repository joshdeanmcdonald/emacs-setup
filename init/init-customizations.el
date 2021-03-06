
(require 'uniquify)
(require 'backup-dir)

(autoload 'scratch "scratch" nil t)

(setq visible-bell t
      c-basic-offset 2
      debug-on-error nil
      linum-format " %d "
      redisplay-dont-pause t
      ring-bell-function 'ignore
      display-time-24hr-format t
      inhibit-startup-screen t
      uniquify-buffer-name-style 'post-forward
      uniquify-separator ":"
      ag-highlight-search t
      initial-scratch-message nil
      ispell-program-name "aspell"
      ediff-window-setup-function 'ediff-setup-windows-plain
      bkup-backup-directory-info '((t "~/.backups" ok-create full-path))
      custom-file (concat emacs-root "/mine/mine-customizations.el")
      kill-buffer-query-functions    (remq 'process-kill-buffer-query-function
                                           kill-buffer-query-functions))

(global-linum-mode 1)
(blink-cursor-mode t)
(when (string-match-p "^Battery" (battery))
  (display-battery-mode))
(display-time-mode t)
(delete-selection-mode t)

;; (if (not (eq window-system nil))
;;     (require 'init-color-theme))

(setq-default tab-width 2
              indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

(put 'upcase-region    'disabled nil)
(put 'downcase-region  'disabled nil)
(put 'narrow-to-region 'disabled nil)

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(eval-after-load "dabbrev" '(defalias 'dabbrev-expand 'hippie-expand))
(setq hippie-expand-try-functions-list
      '(try-expand-all-abbrevs
        try-expand-list
        try-expand-dabbrev-visible
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-complete-file-name-partially
        try-complete-file-name))

(provide 'init-customizations)

(setq catppuccin-flavor 'mocha)
(setq doom-theme 'catppuccin)
(setq doom-font (font-spec :family "Hack Nerd Font Mono" :size 12))
(setq display-line-numbers-type 'relative)

(setq-default truncate-lines t)
(setq-default fill-column 80)
(setq-default tab-width 2)
(setq-default evil-shift-width 2)
(setq-default indent-tabs-mode nil)

(setq scroll-margin 8)
(setq split-width-threshold nil)
(setq split-height-threshold nil)
(setq-default show-trailing-whitespace t)

(setq undo-tree-auto-save-history t)

(setq case-fold-search t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(global-hl-line-mode 1)
(column-number-mode 1)

(add-hook 'prog-mode-hook
          (lambda ()
            (setq display-fill-column-indicator-column 80)
            (display-fill-column-indicator-mode 1)))

(add-hook 'prog-mode-hook
          (lambda ()
            (setq-local whitespace-style '(face trailing lines-tail))
            (setq-local whitespace-line-column 120)
            (whitespace-mode 1)))

(after! dired
  (setq dired-listing-switches
        "--all --human-readable --group-directories-first --no-group")

  (evil-define-key 'normal dired-mode-map
    (kbd "-") #'dired-up-directory
    (kbd "h") #'dired-up-directory
    (kbd "l") #'dired-find-file))

(map!
 :leader
 :desc "Find files"           "f f" #'find-file
 :desc "Recent files"         "f ." #'consult-recent-file
 :desc "Live grep"            "f g" #'consult-ripgrep
 :desc "Buffers"              "f b" #'consult-buffer
 :desc "Diagnostics"          "f d" #'+default/diagnostics
 :desc "Resume search"        "f r" #'vertico-repeat
 :desc "Open terminal"        "o t" #'+vterm/toggle
 :desc "Project terminal"     "o T" #'+vterm/here

 :desc "Search current buffer" "/" #'consult-line)

(after! eglot
  (map! :map eglot-mode-map
        :n "gd" #'xref-find-definitions
        :n "gr" #'xref-find-references
        :n "gD" #'xref-find-definitions
        :n "K"  #'eldoc
        :n "[d" #'flymake-goto-prev-error
        :n "]d" #'flymake-goto-next-error
        :localleader
        :desc "Rename"      "r n" #'eglot-rename
        :desc "Code action" "c a" #'eglot-code-actions
        :desc "Format"      "f"   #'eglot-format
        :desc "Reconnect"   "R"   #'eglot-reconnect))

(after! agda2-mode
  (setq agda2-highlight-face-groups nil)

  (map! :map agda2-mode-map
        :localleader
        :desc "Load"         "a l" #'agda2-load
        :desc "Refine"       "a r" #'agda2-refine
        :desc "Make case"    "a c" #'agda2-make-case
        :desc "Goals"        "a g" #'agda2-goals-action
        :desc "Type / ctx"   "a t" #'agda2-goal-type
        :desc "Context"      "a C" #'agda2-goal-and-context
        :desc "Normalize"    "a n" #'agda2-compute-normalised-maybe-toplevel
        :desc "Solve"        "a s" #'agda2-auto-maybe-all
        :desc "Definition"   "a d" #'agda2-goto-definition-keyboard
        :desc "Next goal"    "a ]" #'agda2-next-goal
        :desc "Prev goal"    "a [" #'agda2-previous-goal))

  (setq-local comment-start "-- "
              comment-end ""))

(add-hook 'agda2-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'agda2-load nil t)))

(after! lispy
  (add-hook 'emacs-lisp-mode-hook #'lispy-mode)
  (add-hook 'lisp-mode-hook #'lispy-mode)
  (add-hook 'lisp-data-mode-hook #'lispy-mode)
  (add-hook 'scheme-mode-hook #'lispy-mode)
  (add-hook 'racket-mode-hook #'lispy-mode))

(after! lispyville
  (lispyville-set-key-theme
   '(operators c-w additional additional-insert slurp/barf-cp)))

(map! :after lispyville
      :map lispy-mode-map
      :n "ls>" #'lispyville-slurp-sexp
      :n "ls<" #'lispyville-barf-sexp
      :n "lss" #'lispy-splice
      :n "lsr" #'lispy-raise-sexp)

(setq vterm-shell (or (getenv "SHELL") "/bin/sh"))

(doom!
 :completion
 vertico
 company

 :ui
 doom
 doom-dashboard
 modeline
 nav-flash
 ophints
 (popup +defaults)
 window-select
 ligatures
 (vc-gutter +pretty)
 hl-todo

 :editor
 (evil +everywhere)
 fold
 (format +onsave)
 snippets

 :emacs
 undo
 dired
 electric
 vc

 :term
 eshell
 vterm

 :os
 (:if (featurep :system 'macos) macos)
 (tty +osc)

 :lang
 emacs-lisp
 agda
 (nix +lsp)
 racket
 (latex +lsp)
 (sh +lsp +fish)
 (cc +lsp)
 (java +lsp)
 (lua +lsp)
 (haskell +lsp)
 (ocaml +lsp)
 (scala +lsp)
 (erlang +lsp)
 ess
 markdown
 json
 yaml

 :tools
 (lsp +eglot)
 direnv
 magit
 lookup
 (eval +overlay)
 editorconfig

 :config
 (default +bindings +smartparens))

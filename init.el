(doom! :completion
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

       :editor
       evil
       fold
      (format +onsave)

       :emacs
       undo
       dired

       :term
       eshell
       vterm

       :os
       (:if (featurep :system 'macos) macos)
       (tty +osc)

       :lang
       emacs-lisp
       (nix +lsp)
       (scheme +racket)
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

       :config
       (default +bindings +smartparens))


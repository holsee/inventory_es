[
  locals_without_parens: [defcommand: 1, defcommand: 2, defevent: 1, defevent: 2],
  import_deps: [:ecto],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  subdirectories: ["priv/*/migrations"]
]

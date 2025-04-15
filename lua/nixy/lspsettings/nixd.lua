return {
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt" },
      },
      options = {
        nixos = {
          expr =
          '(builtins.getFlake ("git+file://" + toString /home/ben/Development/dotfiles/.)).nixosConfigurations.siegmund.options',
        },
        home_manager = {
          expr =
          '(builtins.getFlake ("git+file://" + toString /home/ben/Development/dotfiles/.)).homeConfigurations.ben@siegmund.options',
        },
      },
    }
  },
}

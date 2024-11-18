_: {
  # Project root
  projectRootFile = "flake.nix";
  # Terraform formatter
  programs = {
    nixfmt.enable = true;
    stylua.enable = true;
  };
}

_: {
  # Project root
  projectRootFile = "flake.nix";
  # Terraform formatter
  programs = {
    nixfmt-rfc-style.enable = true;
    stylua.enable = true;
  };
}

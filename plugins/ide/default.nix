{
  imports = [
    # Languages
    ./langs/go.nix
    ./langs/nix.nix
    ./langs/helm.nix
    ./langs/rust.nix
    ./langs/yaml.nix
    ./langs/terraform.nix

    # Debugging
    ./diagnostics.nix
    ./debug.nix
    ./neotest.nix

    # Navigation / UX
    ./snacks.nix
    ./navic.nix
  ];

  plugins = {
    dressing.enable = true; # better ui-elements
    fidget.enable = true; # LSP progress
  };
}

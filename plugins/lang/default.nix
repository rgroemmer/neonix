{
  imports = [
    ./go.nix
    ./yaml.nix
    ./helm.nix
    ./nix.nix
    ./terraform.nix
  ];

  plugins = {
    trouble.enable = true; # Diagnostics with lsp, treesitter, etc.
  };
}

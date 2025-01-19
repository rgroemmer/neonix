{
  imports = [
    # Syntax & intellisense
    ./lsp.nix
    ./treesitter.nix
    ./cmp.nix
    ./snippet.nix

    # Explorer & files
    ./mini.nix
    ./oil.nix
    ./telescope.nix

    # Look & feel
    ./lualine.nix
    ./which-key.nix
    ./better-escape.nix

    ./diagnostics.nix
  ];

  # Core plugins wo/configuration
  plugins = {
    nvim-autopairs.enable = true;
    web-devicons.enable = true; # dependency for core-plugins
    dressing.enable = true; # better ui-elements
    fidget.enable = true; # LSP progress
  };
}

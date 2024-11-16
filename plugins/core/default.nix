{
  imports = [
    ./colorscheme.nix

    # Syntax & intellisense
    ./lsp.nix
    ./treesitter.nix
    ./cmp.nix
    ./snippet.nix

    # Explorer & files
    ./mini.nix
    ./telescope.nix

    # Look & feel
    ./lualine.nix
    ./which-key.nix
    ./better-escape.nix
  ];

  # Core plugins wo/configuration
  plugins = {
    nvim-autopairs.enable = true;
    web-devicons.enable = true; # dependency for core-plugins
    dressing.enable = true; # better ui-elements
    sleuth.enable = true; # auto detect indentation, tabstop
  };
}

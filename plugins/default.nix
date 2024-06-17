{
  imports = [
    ./lsp.nix
    ./cmp.nix
    ./lualine.nix
    ./explorer.nix
    ./treesitter.nix
    ./telescope.nix
    ./wilder.nix
    ./which-key.nix
    ./mini.nix
    ./lazygit.nix
    ./debug.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      integrations = {
        alpha = true;
        cmp = false;
        dashboard = true;
        illuminate.enabled = true;
        mini.enabled = true;
        telescope.enabled = true;
      };
    };
  };

  highlightOverride = {
    "@variable" = {
      fg = "#f2cdcd";
      bg = null;
    };
    "LspSignatureActiveParameter" = {
      fg = null;
      bg = "#313244";
    };
  };

  plugins = {
    nvim-colorizer.enable = true;
    dressing.enable = true;
    illuminate.enable = true;
    better-escape = {
      enable = true;
      mapping = [ "jk" ];
    };
    friendly-snippets = {
      enable = true;
    };
    luasnip = {
      enable = true;
    };
  };
}

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
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      integrations = {
        alpha = true;
        cmp = true;
        dashboard = true;
        illuminate.enabled = true;
        mini.enabled = true;
        telescope.enabled = true;
      };
    };
  };

  plugins = {
    bufferline.enable = true;
    illuminate.enable = true;
    better-escape = {
      enable = true;
      mapping = [ "jk" ];
    };
  };
}

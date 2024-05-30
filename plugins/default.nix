{
  imports = [
    ./lsp.nix
    ./cmp.nix
    ./lualine.nix
    ./explorer.nix
    ./treesitter.nix
    ./telescope.nix
    ./wilder.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
    };
  };

  plugins = {
    bufferline.enable = true;
    which-key.enable = true;
    better-escape = {
      enable = true;
      mapping = [ "jk" ];
    };
  };
}

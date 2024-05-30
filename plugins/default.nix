{
  imports = [
    ./lsp.nix
    ./cmp.nix
    ./lualine.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
    };
  };

  plugins = {
    bufferline.enable = true;
    better-escape = {
      enable = true;
      mapping = [ "jk" ];
    };
  };
}

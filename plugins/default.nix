{
  imports = [
    ./bufferline.nix
    ./lsp.nix
    ./cmp.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
    };
  };

  plugins = {
    better-escape = {
      enable = true;
      mapping = [ "jk" ];
    };
  };
}

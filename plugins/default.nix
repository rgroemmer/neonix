{
  imports = [
    ./bufferline.nix
    ./lsp.nix
  ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
    };
  };
}

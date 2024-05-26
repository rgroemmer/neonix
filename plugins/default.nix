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
}

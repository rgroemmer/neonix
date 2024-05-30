{
  imports = [ ./bufferline.nix ./lsp.nix ];

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
    };
  };

  plugins = {
    better-escape = {
      enable = true;
      mapping = ["jk"];
    };
  };
}

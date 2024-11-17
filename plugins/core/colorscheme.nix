{
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
        navic.enabled = true;
      };
    };
  };

  # colorscheme overwrites / fixes
  highlightOverride = {
    "@variable" = {
      fg = "#ea999c";
      bg = null;
    };
    "LspSignatureActiveParameter" = {
      fg = null;
      bg = "#313244";
    };
  };

  # Theme or related plugins
  plugins = {
    nvim-colorizer.enable = true; # highlight hex colors & more
    illuminate.enable = true; # highlight word under cursor
    todo-comments.enable = true; # highlight todo comments
  };
}

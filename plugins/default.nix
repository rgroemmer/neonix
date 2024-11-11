{
  imports = [
    ./lsp.nix
    ./cmp.nix
    ./lualine.nix
    ./explorer.nix
    ./treesitter.nix
    ./telescope.nix
    ./which-key.nix
    ./mini.nix
    ./lazygit.nix
    ./debug.nix
    ./yaml-companion.nix
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
        navic.enabled = true;
      };
    };
  };

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

  plugins = {
    web-devicons.enable = true;
    navic.enable = true;
    nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;
    sleuth.enable = true;
    dressing.enable = true;
    illuminate.enable = true;
    trouble.enable = true;
    better-escape = {
      enable = true;
      settings = {
        default_mappings = false;
        mappings = {
          c = {
            j = {
              j = "<Esc>";
              k = "<Esc>";
            };
          };
          i = {
            j = {
              j = "<Esc>";
              k = "<Esc>";
            };
          };
          s = {
            j = {
              k = "<Esc>";
            };
          };
          t = {
            h = {
              h = "<Esc>";
            };
          };
          v = {
            j = {
              k = "<Esc>";
            };
          };
        };
      };
    };
    friendly-snippets = {
      enable = true;
    };
    luasnip = {
      enable = true;
    };
  };
}

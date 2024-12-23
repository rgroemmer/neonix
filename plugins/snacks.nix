{pkgs, ...}: let
  # TODO: Remove when upstream is on latest
  snacks-nvim-git = pkgs.vimUtils.buildVimPlugin {
    name = "snacks-nvim-git";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "snacks.nvim";
      rev = "v2.11.0";
      hash = "sha256-0RLVkdV/R+9eXRCIj8MbpdAx7Tq4h6aRppEFzZC+ILw=";
    };
  };
in {
  extraPlugins = [snacks-nvim-git];

  extraConfigLuaPre = ''
    require "snacks".setup({
      bigfile = {},
      gitbrowse = {},
      lazygit = {},
      notifier = {},
      notify = {},
      scroll = {},
      quickfile = {},
    })
  '';

  keymaps = [
    {
      action = "<cmd>lua Snacks.lazygit.open()<cr>";
      key = "<leader>gg";
      options = {
        desc = "Open LazyGit";
      };
      mode = ["n"];
    }
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>g";
      group = "Git";
      icon = "🐈";
    }
  ];
}

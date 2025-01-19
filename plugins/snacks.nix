{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [snacks-nvim];

  extraConfigLuaPre = ''
    require "snacks".setup({
      bigfile = {},
      gitbrowse = {},
      lazygit = {},
      notifier = {},
      notify = {},
      scroll = {},
      terminal = {},
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
    {
      action = "<cmd>lua Snacks.terminal.toggle()<cr>";
      key = "<leader>T";
      options = {
        desc = "Toggle Terminal";
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

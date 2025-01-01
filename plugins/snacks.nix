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

{
  plugins.lazygit.enable = true;

  keymaps = [
    {
      action = "<cmd>LazyGit<cr>";
      key = "<leader>gg";
      options = {
        desc = "Open LazyGit";
      };
      mode = [ "n" ];
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

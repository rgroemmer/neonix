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
}

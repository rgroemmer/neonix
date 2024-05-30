{
  keymaps = [

    # make splits easy
    {
      action = "<C-w>v";
      key = "<leader>|";
      options = {
        desc = "Split window right";
      };
      mode = [ "n" ];
    }
    {
      action = "<C-w>s";
      key = "<leader>-";
      options = {
        desc = "Split window below";
      };
      mode = [ "n" ];
    }
  ];
}

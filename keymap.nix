{
  keymaps = [

    # make splits easy
    {
      action = "<C-w>v";
      key = "<leader>,";
      options = {
        desc = "Split window right";
      };
      mode = [ "n" ];
    }
    {
      action = "<C-w>s";
      key = "<leader>.";
      options = {
        desc = "Split window below";
      };
      mode = [ "n" ];
    }

    # easy window movement
    {
      action = "<C-w>h";
      key = "<leader>h";
      options = {
        desc = "move window left";
      };
      mode = [ "n" ];
    }
    {
      action = "<C-w>j";
      key = "<leader>j";
      options = {
        desc = "move window up";
      };
      mode = [ "n" ];
    }
    {
      action = "<C-w>k";
      key = "<leader>k";
      options = {
        desc = "move window down";
      };
      mode = [ "n" ];
    }
    {
      action = "<C-w>l";
      key = "<leader>l";
      options = {
        desc = "move right";
      };
      mode = [ "n" ];
    }
  ];
}

{
  keymaps = [

    # make splits easy
    {
      action = "<C-w>v";
      key = "<leader>,";
      options = {
        desc = "Split right";
      };
      mode = [ "n" ];
    }

    {
      action = "<C-w>s";
      key = "<leader>.";
      options = {
        desc = "Split below";
      };
      mode = [ "n" ];
    }

    # easy window movement
    {
      action = "<C-w>h";
      key = "<leader>h";
      options = {
        desc = "move left";
      };
      mode = [ "n" ];
    }
    {
      action = "<C-w>j";
      key = "<leader>j";
      options = {
        desc = "move up";
      };
      mode = [ "n" ];
    }
    {
      action = "<C-w>k";
      key = "<leader>k";
      options = {
        desc = "move down";
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

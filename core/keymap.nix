{
  keymaps = [
    # Copy to system clipboard
    {
      action = "\"+";
      key = "<leader>c";
      options = {
        desc = "System clipboard";
      };
      mode = ["n" "v"];
    }

    # Tiling
    {
      action = "<C-w>v";
      key = "<leader>,";
      options = {
        desc = "Split right";
      };
      mode = ["n"];
    }

    {
      action = "<C-w>s";
      key = "<leader>.";
      options = {
        desc = "Split below";
      };
      mode = ["n"];
    }
    # Window navigation
    {
      action = "<C-w>h";
      key = "<leader>h";
      options = {
        desc = "move left";
      };
      mode = ["n"];
    }
    {
      action = "<C-w>j";
      key = "<leader>j";
      options = {
        desc = "move up";
      };
      mode = ["n"];
    }
    {
      action = "<C-w>k";
      key = "<leader>k";
      options = {
        desc = "move down";
      };
      mode = ["n"];
    }
    {
      action = "<C-w>l";
      key = "<leader>l";
      options = {
        desc = "move right";
      };
      mode = ["n"];
    }
  ];
}

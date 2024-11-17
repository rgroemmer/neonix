{
  plugins.which-key = {
    enable = true;
    settings = {
      layout = {
        height = {
          min = 10;
          max = 25;
        };
        width = {
          min = 20;
          max = 50;
        };
      };
    };
    # Additional which-key descriptions
    settings.spec = [
      {
        __unkeyed-diag = "<leader>sd";
        desc = "Toggle virtual text";
      }
      {
        __unkeyed-numb = "<leader>sn";
        desc = "Toggle relativenumber";
      }
      {
        __unkeyed-numb = "<leader>s";
        desc = "Style";
      }
      {
        __unkeyed-numb = "<leader>r";
        desc = "Refactor";
      }
      {
        __unkeyed-numb = "<leader>d";
        desc = "Debug";
      }
    ];
  };
}

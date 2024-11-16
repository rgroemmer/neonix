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
    ];
  };
}

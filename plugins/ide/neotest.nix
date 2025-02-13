{
  plugins.neotest = {
    enable = true;
    adapters.go.enable = true;
    settings = {
      output = {
        enabled = true;
        open_on_run = true;
      };
      output_panel = {
        enabled = true;
        open = "botright split | resize 15";
      };
      quickfix = {
        enabled = false;
      };
    };
  };
  keymaps = [
    {
      action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>";
      key = "<leader>tt";
      options = {
        desc = "Fun file";
      };
      mode = [
        "n"
      ];
    }
    {
      action = "<cmd>lua require('neotest').run.run(vim.loop.cwd())<cr>";
      key = "<leader>tT";
      options = {
        desc = "Run All Test Files";
      };
      mode = [
        "n"
      ];
    }
    {
      action = "<cmd>lua require('neotest').run.run()<cr>";
      key = "<leader>tr";
      options = {
        desc = "Run Nearest";
      };
      mode = [
        "n"
      ];
    }
    {
      action = "<cmd>lua require('neotest').summary.toggle()<cr>";
      key = "<leader>ts";
      options = {
        desc = "Toogle Summary";
      };
      mode = [
        "n"
      ];
    }
    {
      action = "<cmd>lua require('neotest').output.open({enter=true, auto_close=true})<cr>";
      key = "<leader>to";
      options = {
        desc = "Show output";
      };
      mode = [
        "n"
      ];
    }
  ];
}

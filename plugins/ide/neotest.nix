{
  plugins.neotest = {
    enable = true;
    adapters.go.enable = true;
    lazyLoad.settings = {
      cmd = "Neotest";
      keys = [
        {
          __unkeyed-1 = "<leader>t";
          __unkeyed-3 = "<CMD>Neotest summary<CR>";
          desc = "🧪 Summary toggle";
        }
      ];
    };
  };
  extraConfigLua =
    # lua
    ''
      -- Make q to quit floating windows
      vim.keymap.set('n', 'q', function()
        local winid = vim.api.nvim_get_current_win()
        local config = vim.api.nvim_win_get_config(winid)

        if config.relative ~= "" then
          vim.api.nvim_win_close(winid, true)
        else
          vim.api.nvim_feedkeys('q', 'n', false)
        end
      end, { noremap = true, silent = true })
    '';
}

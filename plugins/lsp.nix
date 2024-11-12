{
  plugins = {
    lsp = {
      enable = true;

      keymaps = {
        diagnostic = {
          "]d" = "goto_next";
          "[d" = "goto_prev";
        };

        lspBuf = {
          K = "hover";
          gD = "declaration";
          gr = "references";
          gd = "definition";
          ca = "code_action";
          gi = "implementation";
          gt = "type_definition";
          "<leader>rn" = {
            action = "rename";
            desc = "Rename";
          };
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        formatOnSave = {
          lspFallback = true;
          timeoutMs = 500;
        };
      };
    };
    lint.enable = true;
  };

  extraConfigLua = ''
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    	callback = function()
    		require("lint").try_lint()
    	end,
    })
  '';
}

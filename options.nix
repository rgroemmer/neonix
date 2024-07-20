{
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };

  diagnostics = {
    virtual_text = false;
  };

  extraConfigLuaPost =
    # lua
    ''
      -- show diagnostics on line hover
      vim.api.nvim_create_autocmd({ "CursorHold" }, {
          pattern = "*",
          callback = function()
              for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
                  if vim.api.nvim_win_get_config(winid).zindex then
                      return
                  end
              end
              vim.diagnostic.open_float({
                  scope = "cursor",
                  focusable = false,
                  close_events = {
                      "CursorMoved",
                      "CursorMovedI",
                      "BufHidden",
                      "InsertCharPre",
                      "WinLeave",
                  },
              })
          end
      })


      local signs = { Error = "💥", Warn = "🚧", Hint = "💡", Info = " " }
      for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      })

      vim.keymap.set("n", "<leader>dv", function()
          isLspDiagnosticsVisible = not isLspDiagnosticsVisible
          vim.diagnostic.config({
              virtual_text = isLspDiagnosticsVisible,
              underline = isLspDiagnosticsVisible
            })
      end)

      vim.keymap.set("n", "<leader>dn", function()
      	if vim.wo.relativenumber then
      		vim.wo.relativenumber = false
     		vim.wo.number = true
      	else
      		vim.wo.relativenumber = true
      		vim.wo.number = false
      	end
      end)

    '';

  opts = {
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions";
    completeopt = "menu,menuone,noselect";

    spelllang = "en";

    switchbuf = "useopen,uselast";
    termguicolors = true;
    scrolloff = 8;
    swapfile = false;
    hlsearch = false;
    incsearch = true;

    shiftwidth = 2;
    tabstop = 2;
    softtabstop = 2;
    expandtab = true;
    smartindent = true;

    list = true;
    listchars = "tab:  ,trail:λ";

    cursorline = true;
    number = true;
    relativenumber = false;
    numberwidth = 3;
    ruler = false;
    showmode = false;

    splitbelow = true;
    splitright = true;
    undofile = true;
    undolevels = 10000;

    signcolumn = "yes";
    cmdheight = 1;
    cot = [
      "menu"
      "menuone"
      "noselect"
    ];
    colorcolumn = "120";

    updatetime = 100;
    timeout = true;
    timeoutlen = 350;

    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    winwidth = 10;
    winminwidth = 10;
    equalalways = false;
  };
}

{
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };

  diagnostics = {
    virtual_text = false;
  };

  extraConfigLuaPost = ''
    local ns = vim.api.nvim_create_namespace('CurlineDiag')
    vim.opt.updatetime = 100
    vim.api.nvim_create_autocmd('LspAttach',{
      callback = function(args)
        vim.api.nvim_create_autocmd('CursorHold', {
          buffer = args.buf,
          callback = function()
            pcall(vim.api.nvim_buf_clear_namespace,args.buf,ns, 0, -1)
            local hi = { 'Error', 'Warn','Info','Hint'}
            local curline = vim.api.nvim_win_get_cursor(0)[1]
            local diagnostics = vim.diagnostic.get(args.buf, {lnum =curline - 1})
            local virt_texts = { { (' '):rep(4) } }
            for _, diag in ipairs(diagnostics) do
              virt_texts[#virt_texts + 1] = {diag.message, 'Diagnostic'..hi[diag.severity]}
            end
            vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0,{
              virt_text = virt_texts,
              hl_mode = 'combine'
            })
          end
        })
      end
    })
  '';

  opts = {
    # TODO
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
    relativenumber = true;
    numberwidth = 2;
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

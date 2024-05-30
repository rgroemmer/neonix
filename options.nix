{
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };

  opts = {
    # TODO
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions";

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

    splitbelow = true;
    splitright = true;
    undofile = true;
    undolevels = 10000;

    signcolumn = "yes";
    cmdheight = 1;
    cot = ["menu" "menuone" "noselect"];
    colorcolumn = "120";

    updatetime = 100;
    timeout = true;
    timeoutlen = 250;

    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    winwidth = 10;
    winminwidth = 10;
    equalalways = false;
  };
}

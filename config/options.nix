{
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };

  # custom command config
  userCommands = {
    # macos workaround for strange behavior
    W = {
      command = "w";
    };
    Q = {
      command = "q";
    };
  };

  # TODO: remove defaults, document settings
  opts = {
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions";
    completeopt = "menuone,noinsert,noselect";

    spelllang = "en";

    switchbuf = "useopen,uselast";
    termguicolors = true;
    scrolloff = 8;
    swapfile = false;

    # search
    ignorecase = true; # ignores case in search
    smartcase = true; # if uppercase found -> case sensitive search
    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;

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

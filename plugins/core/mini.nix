{lib, ...}: {
  plugins.mini = {
    enable = true;
    modules = {
      starter = {
        header = lib.concatLines [
          "███╗   ██╗███████╗ ██████╗ ███╗   ██╗██╗██╗  ██╗"
          "████╗  ██║██╔════╝██╔═══██╗████╗  ██║██║╚██╗██╔╝"
          "██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██║ ╚███╔╝ "
          "██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║██║ ██╔██╗ "
          "██║ ╚████║███████╗╚██████╔╝██║ ╚████║██║██╔╝ ██╗"
          "╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝"
        ];
        items = [
          {
            name = "Find File";
            action = "Telescope find_files follow=true no_ignore=true hidden=true";
            section = "";
          }
          {
            name = "Recent File";
            action = "Telescope oldfiles";
            section = "";
          }
          {
            name = "Quit";
            action = "qa";
            section = "";
          }
        ];
        footer = "I use NIX btw. -- RAPSN";
      };

      files = {}; # mini file explorer
      comment = {}; # toggle comments
    };
  };

  keymaps = [
    # explorer
    {
      action = ":lua MiniFiles.open()<CR>";
      key = "-";
      options = {
        desc = "Mini explorer";
      };
      mode = ["n"];
    }
  ];
}

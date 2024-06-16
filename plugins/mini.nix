{ lib, ... }:
{
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
        footer = "I use NIX btw.";
      };

      files = {}; # mini file explorer
      comment = {}; # toggle comments
      pairs = {}; # auto pairs
    };
  };
}

{
  plugins.lsp = {
    enable = true;

    servers.gopls.enable = true;

    keymaps = {
      diagnostic = {
        "]d" = "goto_next";
        "[d" = "goto_prev";
      };
      lspBuf = {
        K = "hover";
        gD = "declaration";
        # gr = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        "<leader>cr" = {
          action = "rename";
          desc = "Rename";
        };
      };
    };
  };
}

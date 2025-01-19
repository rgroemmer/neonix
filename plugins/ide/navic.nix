{
  plugins.navic = {
    enable = true;
    settings = {
      lsp.auto_attach = true;
      separator = "→ ";
      depth_limit_indicator = "..";
    };

    luaConfig.post = ''
      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    '';
  };
}

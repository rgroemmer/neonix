{
  plugins = {

    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = {

        sources = {
          __raw = ''
            cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'path' },
              -- { name = 'ultisnips' },
              -- { name = 'snippy' },
              -- { name = 'vsnip' },
            }, {
              { name = 'buffer' },
            })
          '';
        };

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
  };
}

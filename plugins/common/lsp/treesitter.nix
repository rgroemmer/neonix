{config, ...}: {
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        highlight = {
          enable = true;
        };
        indent = {
          enable = true;
        };
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            node_decremental = "<bs>";
          };
        };
      };

      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        c
        css
        bash
        fish
        diff

        vim
        vimdoc
        vhs

        json
        toml
      ];
    };
  };
}

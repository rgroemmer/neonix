{
  pkgs,
  config,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = {
      settings = {
        formatters_by_ft = {
          yaml = ["yamlfmt"];
        };
        formatters = {
          yamlfmt = {
            command = lib.getExe pkgs.yamlfmt;
          };
        };
      };
    };
    lsp.servers.yamlls = {
      enable = true;
    };
  };

  extraPackages = with pkgs; [helm-ls];

  plugins.treesitter = {
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [yaml];
  };
}

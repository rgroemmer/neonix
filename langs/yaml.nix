{ pkgs, config, ... }:
{
  plugins.lsp.servers.yamlls = {
    enable = true;
  };

  plugins.treesitter = {
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [ yaml ];
  };
}

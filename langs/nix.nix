{ config, ... }:
{
  plugins = {
    nix.enable = true;
    # highlight inline code in nix files
    hmts.enable = true;

    lsp.servers.nil_ls = {
      enable = true;
    };

    treesitter = {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [ nix ];
    };
  };
}

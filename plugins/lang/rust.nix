{
  pkgs,
  config,
  lib,
  ...
}: {
  plugins = {
    lsp.servers.rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          rust = ["rustfmt"];
        };

        formatters = {
          rustfmt = {
            command = lib.getExe' pkgs.rustfmt;
          };
        };
      };
    };

    lint = {
      lintersByFt = {
        rust = ["clippy"];
      };
      linters = {
        clippy = {
          cmd = lib.getExe pkgs.clippy;
        };
      };
    };
  };
  plugins.treesitter = {
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [rust];
  };
}

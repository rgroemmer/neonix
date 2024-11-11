{ pkgs, config, ... }:
{
  # packages required in PATH for this lang
  extraPackages = with pkgs; [
    go
    gopls
    delve
  ];

  plugins = {
    lsp.servers.gopls = {
      enable = true;

      extraOptions.settings = {
        gopls = {
          staticcheck = true;
          directoryFilters = [
            "-.git"
            "-.vscode"
          ];
          semanticTokens = true;
          analyses = {
            fieldalignment = true;
            useany = true;
          };
        };
      };
    };

    dap.extensions.dap-go = {
      enable = true;
      delve = {
        port = "38697";
        path = "dlv";
      };
      dapConfigurations = [
        {
          type = "go";
          name = "Attach remote";
          mode = "remote";
          request = "attach";
        }
      ];
    };

    conform-nvim = {
      settings = {
        formattersByFt = {
          go = [ "goimports" ];
        };

        formatters = {
          goimports = {
            command = "${pkgs.gotools}/bin/goimports";
          };
        };
      };
    };

    lint = {
      lintersByFt = {
        go = [ "golangcilint" ];
      };
      linters = {
        golangcilint = {
          cmd = "${pkgs.golangci-lint}/bin/golangci-lint";
        };
      };
    };

  };
  plugins.treesitter = {
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [ go ];
  };
}

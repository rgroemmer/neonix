{
  pkgs,
  config,
  lib,
  ...
}: {
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

          codelenses = {
            gc_details = false;
            generate = true;
            regenerate_cgo = true;
            run_govulncheck = true;
            test = true;
            tidy = true;
            upgrade_dependency = true;
            vendor = true;
          };
        };
      };
    };

    dap-go = {
      enable = true;

      lazyLoad.settings = {
        ft = "go";
      };

      settings = {
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
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          go = ["goimports"];
        };

        formatters = {
          goimports = {
            command = lib.getExe' pkgs.gotools "goimports";
          };
        };
      };
    };

    lint = {
      lintersByFt = {
        go = ["golangcilint"];
      };
      linters = {
        golangcilint = {
          cmd = lib.getExe pkgs.golangci-lint;
        };
      };
    };
  };
  plugins.treesitter = {
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [go];
  };
}

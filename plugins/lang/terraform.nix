{
  config,
  pkgs,
  lib,
  ...
}: {
  extraPackages = with pkgs; [
    terraform
  ];

  plugins = {
    lsp.servers.terraformls = {
      enable = true;
    };

    conform-nvim = {
      settings = {
        formatters_by_ft = {
          tf = ["terraform_fmt"];
          terraform = ["terraform_fmt"];
        };

        formatters = {
          terraform_fmt = {
            command = lib.getExe' pkgs.terraform "fmt";
          };
        };
      };
    };

    treesitter = {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
        terraform
        hcl
      ];
    };
  };
}

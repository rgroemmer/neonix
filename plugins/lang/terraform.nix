{ config, pkgs, ... }:
{
  plugins = {
    lsp.servers.terraformls = {
      enable = true;
    };

    conform-nvim = {
      settings = {
        formattersByFt = {
          tf = [ "terraform_fmt" ];
          terraform = [ "terraform_fmt" ];
        };

        formatters = {
          terraform_fmt = {
            command = "${pkgs.terraform}/bin/terraform fmt";
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

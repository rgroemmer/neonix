{ config, pkgs, ... }:
{
  extraPackages = with pkgs; [
    nixfmt-rfc-style
    statix
  ];

  plugins = {
    nix.enable = true;
    # highlight inline code in nix files
    hmts.enable = true;

    lsp.servers.nil-ls = {
      enable = true;
    };

    conform-nvim = {
      formattersByFt = {
        nix = [ "nixfmt" ];
      };
      formatters = {
        nixfmt = {
          command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt}";
        };
      };
    };

    lint = {
      lintersByFt = {
        nix = [ "statix" ];
      };
      linters = {
        statix = {
          cmd = "${pkgs.statix}/bin/statix";
        };
      };
    };

    treesitter = {
      grammarPackages = with config.plugins.treesitter.package.builtGrammars; [ nix ];
    };
  };

  extraConfigVim = ''
    au BufRead,BufNewFile flake.lock setf json
  '';
}

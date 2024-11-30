{
  pkgs,
  lib,
  ...
}: {
  extraPackages = with pkgs; [helm-ls];

  extraPlugins = with pkgs.vimPlugins; [vim-helm];

  extraConfigLua =
    # lua
    ''
      local lspconfig = require('lspconfig')

      -- setup helm-ls
      lspconfig.helm_ls.setup {
      	settings = {
      		['helm-ls'] = {
      			yamlls = {
      				path = "${lib.getExe pkgs.yaml-language-server}",
      			}
      		}
      	}
      }
    '';
}

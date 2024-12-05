{
  pkgs,
  inputs,
  ...
}: let
  nvim-yaml-companion = with pkgs;
    vimUtils.buildVimPlugin {
      pname = "yaml-companion";
      version = "main";
      src = inputs.yaml-companion;
    };
in {
  extraPlugins = [nvim-yaml-companion];

  extraConfigLua =
    # lua
    ''
      local cfg = require("yaml-companion").setup({



        schemas = {
          {
            name = "HelmRelease",
            uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/helmrelease-helm-v1.json",
          },
          {
            name = "HelmRepository",
            uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/helmrepository-source-v1.json",
          },
          {
            name = "GitRepository",
            uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json",
          },
          {
            name = "FluxKustomization",
            uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json",
          },
        },
      })

      require("lspconfig")["yamlls"].setup(cfg)
    '';
}

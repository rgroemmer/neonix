{ pkgs, config, ... }:
{
  extraPackages = with pkgs; [ ];

  plugins.lsp.servers.yamlls = {
    enable = true;
    settings = {
      yaml = {
        schemaStore = {
          enable = true;
          url = "https://www.schemastore.org/api/json/catalog.json";
        };
        schemas = {
          "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/kustomization.json" = "kustomization.yaml";
          kubernetes = "^(?!.*\bkustomization\b).*";
        };
      };
    };
  };

  plugins.treesitter = {
    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [ yaml ];
  };
}

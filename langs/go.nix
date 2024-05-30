{ pkgs, ... }:
{
  # packages required in PATH for this lang
  extraPackages = with pkgs; [
    go
    gopls
  ];

  plugins.lsp.servers.gopls = {
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
}

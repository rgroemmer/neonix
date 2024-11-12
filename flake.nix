{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Move to source when #50 is merged
    yaml-companion = {
      url = "github:someone-stole-my-name/yaml-companion.nvim";
      flake = false;
    };
  };

  outputs =
    {
      nixvim,
      flake-parts,
      self,
      pre-commit-hooks,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      flake = {
        homeManagerModules = {
          default = self.homeManagerModules.neonix;
          # calling module with explicit parameter self
          neonix = import ./hm-module.nix self;
        };
      };

      perSystem =
        { system, self', ... }:
        let
          nixvim' = nixvim.legacyPackages.${system};
          pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          nixvimModule = {
            inherit pkgs;
            module = {

              imports = [
                ./options.nix
                ./keymap.nix
                ./autocmds.nix

                ./plugins
                ./langs
              ];

              viAlias = true;
              vimAlias = true;
            };
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              inherit inputs;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            pre-commit-check = pre-commit-hooks.lib.${system}.run {
              src = ./.;
              hooks = {
                statix.enable = true;
                nixfmt-rfc-style.enable = true;
              };
            };
          };

          formatter = pkgs.nixfmt-rfc-style;

          packages.default = nvim;

          devShells = {
            default =
              with pkgs;
              mkShell {
                inherit (self'.checks.pre-commit-check) shellHook;
                packages = [ nvim ];
              };
          };
        };
    };
}

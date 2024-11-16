{
  description = "RAPSN NeoNix IDE";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Plugins not part of nixpkgs
    yaml-companion = {
      url = "github:someone-stole-my-name/yaml-companion.nvim";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixvim,
    pre-commit-hooks,
    ...
  }: let
    inherit (nixpkgs) lib;

    systems = ["x86_64-linux" "aarch64-darwin"];
    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
    forAllSystems = f: lib.genAttrs systems (system: f pkgsFor.${system});
  in {
    formatter = forAllSystems (pkgs: pkgs.alejandra);
    devShells = forAllSystems (pkgs: import ./shell.nix {inherit pkgs pre-commit-hooks;});

    homeManagerModules = {
      default = self.homeManagerModules.neonix;
      neonix = import ./hm-module.nix self;
    };

    packages = forAllSystems (pkgs: {
      default = nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
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
    });
  };
}

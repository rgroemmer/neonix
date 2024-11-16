{
  description = "RAPSN's NeoNix IDE";

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

    homeManagerModules = {
      default = self.homeManagerModules.neonix;
      neonix = import ./hm-module.nix self;
    };

    formatter = forAllSystems (pkgs: pkgs.alejandra);

    checks = forAllSystems (pkgs: {
      pre-commit-check = pre-commit-hooks.lib.${pkgs.system}.run {
        src = ./.;
        hooks = {
          statix.enable = true;
          alejandra.enable = true;
          deadnix.enable = true;
        };
      };
    });

    devShells = forAllSystems (pkgs: {
      default = with pkgs;
        mkShell {
          inherit (self.checks.${pkgs.system}.pre-commit-check) shellHook;

          packages = [
            nh
            statix
            deadnix
            alejandra
            nix-inspect
          ];
        };
    });
  };
}

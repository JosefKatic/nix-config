{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko-images.url = "github:chrillefkr/disko-images";
    joka00-modules = {
      url = "/home/joka/.nix-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    disko,
    disko-images,
    joka00-modules,
    systems,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["aarch64-linux"];
      perSystem = {
        system,
        pkgs,
        ...
      }: {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          overlays = [inputs.joka00-modules.overlays.joka00-modules];
          config = {
            allowUnfree = true;
            allowUnsupportedSystem = true;
          };
        };
      };
      flake = let
        lib = nixpkgs.lib;
        forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
        pkgsFor = lib.genAttrs (import systems) (
          system:
            import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            }
        );
      in {
        nixosConfigurations.aarch64-image = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          pkgs = pkgsFor.aarch64-linux;
          specialArgs = {inherit inputs self;};
          modules = [
            ./configuration.nix
            ./disko-encrypted.nix
            disko.nixosModules.disko
            disko-images.nixosModules.disko-images
          ];
        };
      };
    };
}

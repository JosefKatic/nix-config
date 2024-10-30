{
  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
      "https://cache.joka00.dev"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.joka00.dev:ELw0BiKSycBVWYgv0lFW+Uqjez0Y9gnKEh7sQ/8eHvE="
    ];
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    joka00-modules = {
      url = "github:JosefKatic/nix-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hm = {
      url = "github:nix-community/home-manager";
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
    joka00-modules,
    systems,
    hm,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];
      imports = [
        ./shell.nix
        ./hydra
      ];
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
          };
        };
      };
      flake = let
        lib = nixpkgs.lib // hm.lib;
        forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
        pkgsFor = lib.genAttrs (import systems) (
          system:
            import nixpkgs {
              inherit system;
              overlays = [inputs.joka00-modules.overlays.joka00-modules];
              config = {
                allowUnfree = true;
                allowUnsupportedSystem = true;
              };
            }
        );
        hosts = import "${self}/config/nixos/hosts.nix";
      in {
        nixosConfigurations = let
          specialArgs = {inherit inputs self;};
          inherit (nixpkgs.lib) nixosSystem;
          deviceConfigurations =
            map (host: {
              name = host;
              value = nixosSystem {
                specialArgs = specialArgs;
                modules = let
                  hostConfig = import "${self}/config/nixos/${host}/default.nix";
                in [
                  {
                    networking.hostName = host;
                    imports = [
                      joka00-modules.nixosModules.default
                      joka00-modules.nixosModules.nordvpn
                      hostConfig
                      "${self}/config/nixos/company.nix"
                    ];
                  }
                ];
              };
            })
            hosts;
        in
          builtins.listToAttrs deviceConfigurations;

        homeConfigurations = let
          inherit (lib) homeManagerConfiguration concatMap;
          configs =
            concatMap (
              host: let
                hostConfig = import "${self}/config/nixos/${host}/default.nix";
                listOfUsers = hostConfig.device.home.users;
              in
                map (user: {
                  name = "${user}@${host}";
                  value = homeManagerConfiguration {
                    modules = [
                      inputs.joka00-modules.homeManagerModules.default
                      "${self}/config/home/${host}/${user}/default.nix"
                    ];
                    pkgs = pkgsFor.x86_64-linux;
                    extraSpecialArgs = {inherit inputs self;};
                  };
                })
                listOfUsers
            )
            hosts;
        in
          builtins.listToAttrs configs;
      };
    };
}

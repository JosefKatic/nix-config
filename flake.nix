{
  nixConfig = {
    extra-substituters = [
      "https://hyprland.cachix.org"
    ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    joka00-modules = {
      url = "/home/joka/.nix-modules";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hm.url = "github:nix-community/home-manager";
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
              config.allowUnfree = true;
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
                    # home-manager = {
                    #   users = {
                    #     "joka" = {
                    #       imports = [
                    #         "${self}/config/home/${host}/joka/default.nix"
                    #         inputs.joka00-modules.homeManagerModules.default
                    #       ];
                    #     };
                    #   };
                    #   extraSpecialArgs = specialArgs;
                    # };
                    networking.hostName = host;
                    imports = [
                      joka00-modules.nixosModules.default
                      joka00-modules.nixosModules.nordvpn
                      hostConfig
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

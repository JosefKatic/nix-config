{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    joka00-modules = {
      url = "github:JosefKatic/nix-modules";
    };
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    joka00-modules,
    systems,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];
      imports = [
        ./shell.nix
      ];
      perSystem = {system, ...}: {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          overlays = [inputs.joka00-modules.overlays.joka00-modules];
        };
      };
      flake = {
        nixosConfigurations = let
          specialArgs = {inherit inputs self;};
          hosts = import "${self}/config/nixos/hosts.nix";
          inherit (nixpkgs.lib) nixosSystem;
          deviceConfigurations =
            map (host: {
              name = host;
              value = nixosSystem {
                specialArgs = specialArgs;
                modules = [
                  {
                    home-manager = {
                      users = let
                        usersForDevice = import "${self}/config/home/${host}/users.nix";
                        userConfigurations =
                          map (user: {
                            name = user;
                            value = {
                              imports = [
                                inputs.joka00-modules.homeManagerModules.default
                                "${self}/config/home/${host}/${user}/default.nix"
                              ];
                            };
                          })
                          usersForDevice;
                      in
                        builtins.listToAttrs userConfigurations;
                      extraSpecialArgs = specialArgs;
                    };
                    networking.hostName = host;
                    imports = [
                      joka00-modules.nixosModules.default
                      "${self}/config/nixos/${host}/default.nix"
                    ];
                  }
                ];
              };
            })
            hosts;
        in
          builtins.listToAttrs deviceConfigurations;
      };
    };
}

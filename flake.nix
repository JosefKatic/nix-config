{
  description = "Your new nix config";

  nixConfig = {
    extra-substituters = [ "https://cache.joka00.dev" ];
    extra-trusted-public-keys = [ "cache.joka00.dev:ELw0BiKSycBVWYgv0lFW+Uqjez0Y9gnKEh7sQ/8eHvE=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";
    nix-colors.url = "github:misterio77/nix-colors";
    nur.url = "github:nix-community/NUR";
    nh = {
      url = "github:viperml/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprsome.url = "github:sopa0/hyprsome";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefly.url = "github:timhae/firefly";
    sops-nix.url = "github:mic92/sops-nix";
    web.url = "github:JosefKatic/web";
  };

  outputs = { self, nixpkgs, home-manager, nur, nixvim, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;
    in
    {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      # templates = import ./templates;

      overlays = import ./overlays { inherit inputs outputs; };
      hydraJobs = import ./hydra.nix { inherit inputs outputs; };

      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs;});
      devShells = forEachSystem (pkgs: import ./shell.nix { inherit pkgs; });
      formatter = forEachSystem (pkgs: pkgs.nil);
    
      wallpapers = import ./home/joka/wallpapers;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        alcedo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/alcedo ];
        };
        hirundo = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/hirundo ];
        };
        falco = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/falco ];
        };
        regulus = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/regulus ];
        };
        strix = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/strix ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#joka@T27'
      homeConfigurations = {
        "joka@alcedo" = lib.homeManagerConfiguration {
          modules = [ ./home/joka/alcedo.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
        "joka@hirundo" = lib.homeManagerConfiguration {
          modules = [ ./home/joka/hirundo.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
        "joka@falco" = lib.homeManagerConfiguration {
          modules = [ ./home/joka/falco.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
        "joka@regulus" = lib.homeManagerConfiguration {
          modules = [ ./home/joka/regulus.nix ];
          pkgs = pkgsFor.aarch64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
        "joka@strix" = lib.homeManagerConfiguration {
          modules = [ ./home/joka/strix.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };
}

# This file (and the global directory) holds config that i use on all hosts
{ config, inputs, outputs, lib, pkgs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./fish.nix
    ./flatpak.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./optin-persistence.nix
    ./secureboot.nix
    ./systemd-initrd.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = { inherit inputs outputs; };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
    };
  };

  environment.enableAllTerminfo = true;

  hardware.enableRedistributableFirmware = true;
  
  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}

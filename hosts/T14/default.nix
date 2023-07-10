# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/joka

    ../common/optional/greetd.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/xdg-portal.nix
  ];

  networking = {
    hostName = "T14";
    networkmanager = {
      enable = true;
    };
  };
  services.gnome.gnome-keyring.enable = true;
  hardware.opengl.enable = true;
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };

  system.stateVersion = "23.05"; # Did you read the comment?

}


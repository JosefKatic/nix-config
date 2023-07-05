# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }: {

  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/joka

    ../common/optional/gamemode.nix
    ../common/optional/greetd.nix
    ../common/optional/nvidia.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/xdg-portal.nix
  ];

  networking = {
    hostName = "T27";
    useDHCP = true;
    interfaces.en01 = {
      useDHCP = true;
      wakeOnLan.enable = true;
      ipv4 = {
        addresses = [{
          address = "10.34.71.16";
          prefixLength = 23;
        }];
      };
    };
  };

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };
 


  system.stateVersion = "23.05"; # Did you read the comment?

}


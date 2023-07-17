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

    ../common/optional/bluetooth.nix
    ../common/optional/gamemode.nix
    ../common/optional/greetd.nix
    ../common/optional/opengl.nix
    ../common/optional/nvidia.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/xdg-portal.nix

    ./kernel.nix
    ./networking.nix
    ./programs.nix
    ./services.nix
  ];
  system.stateVersion = "23.05"; # Did you read the comment?
}


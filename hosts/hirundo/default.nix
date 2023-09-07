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

    ../common/optional/bluetooth.nix
    ../common/optional/flatpak.nix
    ../common/optional/greetd.nix
    ../common/optional/libvirtd.nix
    ../common/optional/nordvpn.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix
    ../common/optional/printing.nix
    ../common/optional/quietboot.nix
    ../common/optional/steam-hardware.nix
    ../common/optional/xdg-portal.nix
    ../common/optional/wireless.nix
    ../common/optional/yubikey.nix

    ./kernel.nix
    ./networking.nix
    ./programs.nix
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
  nix.extraOptions = ''
    extra-platforms = aarch64-linux
  '';
}


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
    ../common/optional/libvirtd.nix
    ../common/optional/nordvpn.nix
    ../common/optional/nvidia.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix
    ../common/optional/printing.nix
    ../common/optional/quietboot.nix
    ../common/optional/secureboot.nix
    ../common/optional/wireshark.nix
    ../common/optional/yubikey.nix
  ];


  networking = {
    hostName = "alcedo";
    firewall = {
      enable = true;
    };
  };

  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  # Check which of these are used
  environment.systemPackages = with pkgs; [
    libgnome-keyring
    libsecret
    curl
    rustup
    virt-manager
    ntfs3g

    (wine.override { wineBuild = "wine64"; })

    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull

    xwaylandvideobridge
  ];
  
  system.stateVersion = "23.05"; # Did you read the comment?
}


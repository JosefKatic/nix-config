# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, lib, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix

    ../common/global
    ../common/users/joka

    ../common/optional/bluetooth.nix
    ../common/optional/greetd.nix
    ../common/optional/libvirtd.nix
    ../common/optional/nordvpn.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix
    ../common/optional/printing.nix
    ../common/optional/quietboot.nix
    ../common/optional/secureboot.nix
    ../common/optional/wireless.nix
    ../common/optional/wireshark.nix
    ../common/optional/yubikey.nix
  ];

  networking = {
    hostName = "hirundo";
    firewall = {
      enable = true;
    };
  };
 hardware.xone.enable = true;
 powerManagement.powertop.enable = true;
 programs = {
    light.enable = true;
    adb.enable = true;
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };

  environment.systemPackages = with pkgs; [
    libgnome-keyring
    libsecret
    curlFull
    rustup
  ];

  system.stateVersion = "23.05"; # Did you read the comment?
  nix.extraOptions = ''
    extra-platforms = aarch64-linux
  '';
}


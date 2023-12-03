{ inputs, pkgs, ... }: {
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4
    ./hardware-configuration.nix

    ../common/global
    ../common/users/joka

    ../common/optional/bluetooth.nix
    # ../common/optional/greetd.nix
    # ../common/optional/nordvpn.nix
    ../common/optional/opengl.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/wireless.nix
    ../common/optional/yubikey.nix
  ];

  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  hardware = {
    raspberry-pi."4".apply-overlays-dtmerge.enable = true;
  };

  hardware.raspberry-pi."4".fkms-3d.enable = true;

  services.xserver.enable = true;

  environment.systemPackages = with pkgs; [
    libraspberrypi
    raspberrypi-eeprom
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      generic-extlinux-compatible.enable = false;
     efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
    };
  };

    # Static IP address
  networking = {
    hostName = "regulus";
    useDHCP = true;
  };



  # Enable argonone fan daemon
  services.hardware.argonone.enable = true;

  # Workaround for https://github.com/NixOS/nixpkgs/issues/154163
  nixpkgs.overlays = [(final: prev: {
    makeModulesClosure = x: prev.makeModulesClosure (x // { allowMissing = true; });
  })];


  system.stateVersion = "23.11";
}
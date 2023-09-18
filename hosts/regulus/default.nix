{ inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4

    ./hardware-configuration.nix

    ../common/global
    ../common/users/joka

    ../common/optional/bluetooth.nix
    # ../common/optional/flatpak.nix
    # ../common/optional/greetd.nix
    # ../common/optional/nordvpn.nix
    # ../common/optional/opengl.nix
    # ../common/optional/pipewire.nix
    # ../common/optional/quietboot.nix
    # ../common/optional/xdg-portal.nix
    ../common/optional/wireless.nix
    # ../common/optional/yubikey.nix
  ];

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


  system.stateVersion = "23.05";
}
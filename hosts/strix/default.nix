{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./services

    ../common/global
    ../common/users/joka
  ];

  networking = {
    hostName = "strix";
    useDHCP = true;
  };
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    loader.grub = {
        enable = true;
        device = "/dev/vda";
    };
  };
  # Slows down write operations considerably
  nix.settings.auto-optimise-store = false;
  boot.binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];

  system.stateVersion = "23.05";
}


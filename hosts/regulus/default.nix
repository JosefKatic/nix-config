{ pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix

    ../common/global
    ../common/users/joka
  ];


  boot = {
    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    bootspec.enable = true;
    loader.grub = {
        enable = true;
        device = "/dev/by-label/system";
    };
  };

  networking = {
    hostname = "regulus";
  };
}
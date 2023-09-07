{ pkgs, ...}: {
  boot = {
    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    bootspec.enable = true;
    loader.grub = {
        enable = true;
        device = "/dev/vda";
    };
  };
}


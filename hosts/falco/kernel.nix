{ pkgs, ...}: {
  boot = {
    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    bootspec.enable = true;
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
    };
  };
}
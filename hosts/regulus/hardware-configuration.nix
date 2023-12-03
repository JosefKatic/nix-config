{
  imports = [
    ../common/optional/ephemeral-btrfs.nix
  ];


  boot = {
    initrd = {
      availableKernelModules = [ 
        "xhci_pci"
        "usbhid"
        "vc4"
        "pcie_brcmstb"
        "reset-raspberrypi"
      ];
    };
  };

  fileSystems = {
    "/efi" = {
      device = "/dev/disk/by-label/EFI";
      fsType = "vfat";
    };
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 8196;
  }];
  
  # hardware.raspberry-pi."4".i2c1.enable = true;

  nixpkgs.hostPlatform.system = "aarch64-linux";

  powerManagement.cpuFreqGovernor = "ondemand";
}
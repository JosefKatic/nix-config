{
  imports = [
    ../common/optional/ephemeral-btrfs.nix
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "sr_mod" "uhci_hcd" "virtio_blk" "virtio_pci" ];
    };
  };
    
  fileSystems."/efi" = {
    device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
  };

  swapDevices = [{
    device = "/.swap/swapfile";
    size = 2048;
  }];

  hardware.cpu.amd.updateMicrocode = true;
  virtualisation.hypervGuest.enable = true;
  systemd.services.hv-kvp.unitConfig.ConditionPathExists = [ "/dev/vmbus/hv_kvp" ];
  nixpkgs.hostPlatform = "x86_64-linux";
}
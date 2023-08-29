{ lib, ... }: {
  imports = [
    ../common/optional/ephemeral-btrfs.nix
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "sr_mod" "uhci_hcd" "virtio_blk" "virtio_pci" ];
    };
  };
    
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/system";
    fsType = "btrfs";
    options = [ "subvol=@boot" ];
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = (1024 * 4);
  }];

  hardware.cpu.amd.updateMicrocode = true;
  virtualisation.hypervGuest.enable = true;
  systemd.services.hv-kvp.unitConfig.ConditionPathExists = [ "/dev/vmbus/hv_kvp" ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
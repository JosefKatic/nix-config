{ modulesPath, lib, ... }:
{
  imports = [
    ../common/optional/ephemeral-btrfs.nix
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
    };
    kernelModules = [ "kvm-amd" ];
    # Enable nested virtualization
    extraModprobeConfig = "options kvm nested=1";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/system";
    fsType = "btrfs";
    options = [ "subvol=@boot" ];
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 8196;
  }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = true;
  virtualisation.hypervGuest.enable = true;
  systemd.services.hv-kvp.unitConfig.ConditionPathExists = [ "/dev/vmbus/hv_kvp" ];
}

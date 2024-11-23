{
  nixpkgs.hostPlatform = "aarch64-linux";
  boot.initrd.availableKernelModules = ["virtio_net" "virtio_pci" "virtio_mmio" "virtio_blk" "virtio_scsi" "9p" "9pnet_virtio"];
  boot.initrd.kernelModules = ["virtio_balloon" "virtio_console" "virtio_rng" "virtio_gpu"];
  device.type = "server";
  device.virtualized = true;
  device.boot.quietboot.enable = true;
  device.boot.uefi.enable = true;
  device.boot.uefi.secureboot = false;
  device.home.users = ["joka"];
}

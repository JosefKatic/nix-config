{
  nixpkgs.hostPlatform = "aarch64-linux";
  boot.initrd.availableKernelModules = ["virtio_net" "virtio_pci" "virtio_mmio" "virtio_blk" "virtio_scsi" "9p" "9pnet_virtio"];
  boot.initrd.kernelModules = ["virtio_balloon" "virtio_console" "virtio_rng" "virtio_gpu"];
  device.boot.quietboot.enable = false;
  device.boot.uefi.enable = true;
  device.home.users = ["joka" "joka-ipa"];
  device.core.kernel = "linux_6_11";
}

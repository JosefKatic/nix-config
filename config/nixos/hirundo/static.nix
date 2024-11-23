{
  device.platform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["ata_piix" "sr_mod" "uhci_hcd" "virtio_blk" "virtio_pci"];
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
  ];
  device.type = "laptop";
  device.virtualized = false;
  device.boot.quietboot.enable = true;
  device.boot.uefi.enable = true;
  device.boot.uefi.secureboot = true;
  device.home.users = ["joka" "joka-ipa"];
  device.hardware.bluetooth.enable = true;
  device.hardware.bluetooth.enableManager = false;
  device.hardware.cpu.amd.enable = true;
  device.hardware.cpu.intel.enable = false;
  device.hardware.disks.hdd.enable = false;
  device.hardware.disks.ssd.enable = true;
  device.hardware.gpu.amd.enable = true;
  device.hardware.gpu.intel.enable = false;
  device.hardware.gpu.nvidia.enable = false;
  device.hardware.misc.trezor.enable = true;
  device.hardware.misc.xbox.enable = true;
  device.hardware.misc.yubikey.enable = true;
  services.nordvpn.enable = true;
  programs.adb.enable = true;
}

{
  device.platform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "sr_mod"];
  services.nordvpn.enable = true;
  device.type = "desktop";
  device.virtualized = false;
  device.boot.quietboot.enable = true;
  device.boot.uefi.enable = true;
  device.boot.uefi.secureboot = true;
  device.core.storage.systemDrive.encrypted.enable = true;
  device.core.storage.systemDrive.encrypted.path = "/dev/disk/by-partlabel/cryptsystem";
  device.core.storage.systemDrive.name = "system";
  device.core.storage.systemDrive.path = "/dev/disk/by-label/system";
  device.home.users = ["joka" "joka-ipa"];
  device.hardware.bluetooth.enable = true;
  device.hardware.bluetooth.enableManager = true;
  device.hardware.cpu.amd.enable = false;
  device.hardware.cpu.intel.enable = true;
  device.hardware.disks.hdd.enable = true;
  device.hardware.disks.ssd.enable = true;
  device.hardware.gpu.amd.enable = false;
  device.hardware.gpu.intel.enable = false;
  device.hardware.gpu.nvidia.enable = true;
  device.hardware.misc.trezor.enable = true;
  device.hardware.misc.xbox.enable = true;
  device.hardware.misc.yubikey.enable = true;
}

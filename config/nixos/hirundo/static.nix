{
  nixpkgs.hostPlatform = "x86_64-linux";
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
  services.nordvpn.enable = true;
  programs.adb.enable = true;
}

{
  device.platform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk"];
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
  ];
  device = {
    type = "server";
    virtualized = true;
    boot = {
      quietboot = {enable = false;};
      uefi = {
        enable = false;
        secureboot = false;
      };
    };
    home = {
      users = ["joka"];
    };
  };
}

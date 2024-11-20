{
  nixpkgs.hostPlatform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["ata_piix" "sr_mod" "uhci_hcd" "virtio_blk" "virtio_pci"];

  device = {
    type = "server";
    virtualized = false;
    build = "FmK7W5o44OWWB0mBXr2xjSUn+4Q=";
    boot = {
      quietboot = {enable = true;};
      uefi = {
        enable = true;
        secureboot = true;
      };
    };
    home = {
      users = ["joka"];
    };

    hardware = {
      bluetooth = {
        enable = true;
        enableManager = false;
      };
      cpu = {
        amd = {enable = false;};
        intel = {enable = true;};
      };
      disks = {
        hdd = {enable = false;};
        ssd = {enable = true;};
      };
      gpu = {
        amd = {enable = false;};
        intel = {enable = true;};
        nvidia = {enable = false;};
      };
      misc = {
        trezor = {enable = false;};
        xbox = {enable = false;};
        yubikey = {enable = false;};
      };
    };
  };
}

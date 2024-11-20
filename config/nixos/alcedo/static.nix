{
  nixpkgs.hostPlatform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" "sr_mod"];
  services.nordvpn.enable = true;
  device = {
    type = "desktop";
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
      users = ["joka" "joka-ipa"];
    };
    hardware = {
      bluetooth = {
        enable = true;
        enableManager = true;
      };
      cpu = {
        amd = {enable = false;};
        intel = {enable = true;};
      };
      disks = {
        hdd = {enable = true;};
        ssd = {enable = true;};
      };
      gpu = {
        amd = {enable = false;};
        intel = {enable = false;};
        nvidia = {enable = true;};
      };
      misc = {
        trezor = {enable = true;};
        xbox = {enable = true;};
        yubikey = {enable = true;};
      };
    };
  };
}

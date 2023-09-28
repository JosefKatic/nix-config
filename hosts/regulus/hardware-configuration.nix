{
  imports = [
    ../common/optional/ephemeral-btrfs.nix
  ];

  nixpkgs.overlays = let
    ubootWithBtrfsAndZstd = oldAttrs: {
      extraConfig = ''
        CONFIG_CMD_BTRFS=y
        CONFIG_ZSTD=y
        CONFIG_USB_UHCI=y
        CONFIG_USB_KEYBOARD=y
        CONFIG_BOOTCOMMAND="setenv boot_prefixes / /boot/ /@root/ /@boot/; run distro_bootcmd;"
      '';
    };
  in [
    (self: super: {
      ubootRaspberryPi3_64bit = super.ubootRaspberryPi3_64bit.overrideAttrs ubootWithBtrfsAndZstd;
      ubootRaspberryPi4_64bit = super.ubootRaspberryPi4_64bit.overrideAttrs ubootWithBtrfsAndZstd;
    })
  ];
  boot = {
    kernelParams = [
      "console=ttyS0,115200n8"
      "console=ttyAMA0,115200n8"
      "console=tty0"
      "root=LABEL=system"
      "rootfstype=btrfs"
      "rootflags=subvol=@root"
      "rootwait"
    ];
    initrd = {
      kernelModules = ["zstd" "btrfs"];
      availableKernelModules = [ "xhci_pci" "hid_cherry"];
    };
    loader = {
      grub.enable = false;
      generic-extlinux-compatible = {
        enable = true;
        configurationLimit = 20;
      };
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-label/system";
      options = [ "subvol=@boot" ];
    };

    "/firmware" = {
      device = "/dev/disk/by-label/FIRMWARE";
      fsType = "vfat";
    };
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 8196;
  }];

  hardware.raspberry-pi."4".i2c1.enable = true;

  nixpkgs.hostPlatform.system = "aarch64-linux";

  powerManagement.cpuFreqGovernor = "ondemand";
}

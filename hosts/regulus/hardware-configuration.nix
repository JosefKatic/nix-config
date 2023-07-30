{ lib, ... }: {
  imports = [
    ../common/optional/ephemeral-btrfs.nix
  ];


  fileSystems."/boot" = {
    device = "/dev/disk/by-label/system";
    fsType = "btrfs";
    options = [ "subvol=@boot" ];
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = (1024 * 8);
  }];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
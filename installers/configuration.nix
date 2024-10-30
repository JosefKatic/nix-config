{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.hostPlatform.system = "aarch64-linux";
  nixpkgs.buildPlatform.system = "x86_64-linux";
  networking.hostName = "installers";

  # Include support for various filesystems and tools to create / manipulate them.
  boot.supportedFilesystems = ["btrfs" "cifs" "f2fs" "ntfs" "vfat" "xfs"];
  # Configure host id for ZFS to work
  networking.hostId = lib.mkDefault "8425e349";

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIOyTynZ2jFg3/FderkubGqccjY1lI+h4vLCqT7NQMNp openpgp:0x4AF78C5A"
  ];
}

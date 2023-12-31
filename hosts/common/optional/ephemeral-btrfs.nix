# This file contains an ephemeral btrfs root configuration
# TODO: perhaps partition using disko in the future
{ lib, config, ... }:
let
  wipeScript = ''
    mkdir /tmp -p
    MNTPOINT=$(mktemp -d)
    (
      mount -t btrfs -o subvol=/ /dev/disk/by-label/system "$MNTPOINT"
      trap 'umount "$MNTPOINT"' EXIT

      echo "Creating needed directories"
      mkdir -p "$MNTPOINT"/persist/var/{log,lib/{nixos,systemd}}

      echo "Cleaning root subvolume"
      btrfs subvolume list -o "$MNTPOINT/@root" | cut -f9 -d ' ' |
      while read -r subvolume; do
        btrfs subvolume delete "$MNTPOINT/$subvolume"
      done && btrfs subvolume delete "$MNTPOINT/@root"

      echo "Restoring blank subvolume"
      btrfs subvolume snapshot "$MNTPOINT/@root-blank" "$MNTPOINT/@root"
    )
  '';
  phase1Systemd = config.boot.initrd.systemd.enable;
in
{
  boot.initrd = {
    supportedFilesystems = [ "btrfs" "ntfs" ];
    postDeviceCommands = lib.mkIf (!phase1Systemd) (lib.mkBefore wipeScript);
    systemd.services.restore-root = lib.mkIf phase1Systemd {
      description = "Rollback btrfs rootfs";
      wantedBy = [ "initrd.target" ];
      requires = [
        "dev-disk-by\\x2dlabel-system.device"
      ];
      after = [
        "dev-disk-by\\x2dlabel-system.device"
        "systemd-cryptsetup@system.service"
      ];
      before = [ "sysroot.mount" ];
      unitConfig.DefaultDependencies = "no";
      serviceConfig.Type = "oneshot";
      script = wipeScript;
    };
  };
  fileSystems = {
  "/" =
    { device = "/dev/disk/by-label/system";
      fsType = "btrfs";
      options = [ "subvol=@root" "compress=zstd" "noatime"  ];
    };

  "/home" =
    { device = "/dev/disk/by-label/system";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" "noatime" ];
    };

  "/nix" =
    { device = "/dev/disk/by-label/system";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };

  "/persist" =
    { device = "/dev/disk/by-label/system";
      fsType = "btrfs";
      options = [ "subvol=@persist" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };
    
  "/swap" = {
      device = "/dev/disk/by-label/system";
      fsType = "btrfs";
      options = [ "subvol=@swap" "compress=zstd" "noatime" ];
    };
  };
}

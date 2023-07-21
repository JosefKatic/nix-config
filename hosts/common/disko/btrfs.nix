{ disks ? [ "/dev/vda" ], memory, ... }: {
  disko.devices = {
    disk = {
      nvme0n1 = {
        type = "disk";
        device = builtins.elemAt disks 0;
        content = {
          type = "gpt";
          partitions = {
            EFI = {
              priority = 1;
              name = "EFI";
              start = "1M";
              end = "512MiB";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/efi";
              };
            };
            system = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                subvolumes = {
                  # Subvolume name is different from mountpoint
                  "/@root" = {
                    mountpoint = "/";
                    mountOptions = [ "subvol=@root" "compress=zstd" "noatime" ];
                  };
                  # Mountpoints inferred from subvolume name
                  "/@home" = {
                    mountpoint = "/home";
                    mountOptions = [ "subvol=@home" "compress=zstd" "noatime" ];
                  };
                  "/@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "subvol=@nix" "compress=zstd" "noatime" ];
                  };
                  "/@persist" = {
                    mountpoint = "/persist";
                    mountOptions = [ "subvol=@persist" "compress=zstd" "noatime" ];
                  };
                  "/@var/log" = {
                    mountpoint = "/var/log";
                    mountOptions = [ "subvol=@var/log" "compress=zstd" "noatime" ];
                  };
                  "/@snapshots" = {
                    mountpoint = "/.snapshots";
                    mountOptions = [ "subvol=@snapshots" "compress=zstd" "noatime" ];
                  };
                  "/@swap" = {
                    mountpoint = "/.swap";
                    mountOptions = [ "subvol=@swap" "nodatacow" "noatime" ];
                  };
                };
                postCreateHook = ''
                  btrfs filesystem mkswapfile --size ${memory} /mnt/.swap/swapfile
                ''
              };
            };
          };
        };
      };
    };
  };
}
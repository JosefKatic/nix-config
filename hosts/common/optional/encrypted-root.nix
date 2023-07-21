{ config, ... }:
{
  boot.initrd = {
    luks.devices."system".device = "/dev/disk/by-partlabel/cryptsystem";
  };
}

{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.joka = {
    isNormalUser = true;
    shell = pkgs.fish;
    initialPassword = "pwd123";
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "minecraft"
      "network"
      "wireshark"
      "i2c"
      "mysql"
      "docker"
      "podman"
      "git"
      "libvirtd"
      "deluge"
    ];
    packages = [ pkgs.home-manager ];
  };

  home-manager.users.joka = import ../../../../home/joka/${config.networking.hostName}.nix;
  services.geoclue2.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = { swaylock = { }; };
}

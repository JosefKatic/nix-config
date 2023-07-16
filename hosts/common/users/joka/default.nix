{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.joka = {
    isNormalUser = true;
    shell = pkgs.fish;
    hashedPassword = "$6$pdq4U5Lo7FhsG7Dc$vrwg5E6SVbwlUurJ.7vDGBdL2dXB35khzdfcebhOo212FjQmolLYo0FwxMQL5mwKpioKbnkYsJxxqh.S1zf1G.";
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
      "nordvpn"
      "docker"
      "podman"
      "git"
      "libvirtd"
      "deluge"
    ];
    packages = [ pkgs.home-manager ];
  };

  home-manager.users.joka = import ../../../../home/joka/${config.networking.hostName}.nix;
  security.sudo = {
    extraConfig = ''
      Defaults passprompt="🔒 Enter password for %p... "
    '';
  };
  services.geoclue2.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  security.pam.services = { swaylock = { }; };
}

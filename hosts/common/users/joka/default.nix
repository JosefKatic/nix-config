{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.joka = {
    isNormalUser = true;
    shell = pkgs.fish;
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
    # initialHashedPassword = "$6$FsOCT1XcMC0RqJef$j/ahrihdhvrlp5FyBPufwG5eLvmXEV8MpBxpm6Lk2kIKQyuTH0ecbpEWBYDEmYH1E1Ck2ijfGZ65DCAPcQx7G1";
    openssh.authorizedKeys.keys = [ (builtins.readFile ../../../../home/joka/ssh.pub) ];
    passwordFile = config.sops.secrets.joka-password.path;
    packages = [
      pkgs.home-manager 
    ];
  };


  sops.secrets.joka-password = {
    sopsFile = ../../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.joka = import ../../../../home/joka/${config.networking.hostName}.nix;
  security.sudo = {
    extraConfig = ''
      Defaults passprompt="🔒 Enter password for %p... "
    '';
  };
  services.geoclue2.enable = true;
  security.pam.services = { swaylock = { }; };
}

{ config, ... }:
{
  nix = {
    sshServe = {
      enable = true;
      keys = [];
      protocol = "ssh";
      write = true;
    };
    settings.trusted-users = [ "nix-ssh" ];
  };
}

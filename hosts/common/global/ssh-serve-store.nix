{ config, ... }:
{
  nix = {
    sshServe = {
      enable = true;
      keys = [ 
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMrMubi3ooI8JN1E3iGF+j51TwloMRnkUCXQWO6gIYCj nix-ssh" 
      ];
      protocol = "ssh";
      write = true;
    };
    settings.trusted-users = [ "nix-ssh" ];
  };
}

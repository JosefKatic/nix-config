{ modulesPath, lib, ... }:
{

    imports = [
    # ./services

    ../common/global
    ../common/users/joka
    ../common/optional/fail2ban.nix
    ../common/optional/tailscale-exit-node.nix
  ] ++ 
   (lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ 
   [(modulesPath + "/virtualisation/digital-ocean-config.nix")]);

   networking = {
    hostName = "falco";
   };

     
     
   nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
   system.stateVersion = "23.05";
}
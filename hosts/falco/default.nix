{

  imports = [
    ./services

    ../common/global
    ../common/users/joka
    ../common/optional/fail2ban.nix
    ../common/optional/tailscale-exit-node.nix

    ./kernel.nix
  ];

   networking = {
    hostName = "falco";
    useDHCP = true;
   };

   system.stateVersion = "23.11";
}
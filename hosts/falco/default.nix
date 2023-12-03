{pkgs, ...}: {

  imports = [
    ./hardware-configuration.nix
    ./services

    ../common/global
    ../common/users/joka
    ../common/optional/fail2ban.nix
    ../common/optional/tailscale-exit-node.nix
  ];

   networking = {
    hostName = "falco";
    useDHCP = true;
   };

   boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    loader.grub = {
        enable = true;
        device = "/dev/vda";
    };
  };

   system.stateVersion = "23.05";
}
{ inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.raspberry-pi-4

    ./hardware-configuration.nix

    ../common/global
    ../common/users/joka
  ];

  # Static IP address
  networking = {
    hostName = "regulus";
    useDHCP = true;
    interfaces.eth0 = {
      useDHCP = true;
      wakeOnLan.enable = true;

      ipv4.addresses = [{
        address = "10.34.70.20";
        prefixLength = 24;
      }];
    };
  };

  # Enable argonone fan daemon
  services.hardware.argonone.enable = true;

  # Workaround for https://github.com/NixOS/nixpkgs/issues/154163
  nixpkgs.overlays = [(final: prev: {
    makeModulesClosure = x: prev.makeModulesClosure (x // { allowMissing = true; });
  })];


  system.stateVersion = "23.05";
}


# { pkgs, ... }: {

#   imports = [
#     ./hardware-configuration.nix

#     ../common/global
#     ../common/users/joka
#   ];


#   boot = {
#     initrd.systemd.enable = true;
#     kernelPackages = pkgs.linuxKernel.packages.linux_zen;
#     bootspec.enable = true;
#     loader.grub = {
#         enable = true;
#         device = "/dev/by-label/system";
#     };
#   };

#   networking = {
#     hostname = "regulus";
#   };
# }
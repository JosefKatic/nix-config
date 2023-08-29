{
  imports = [
    ./hardware-configuration.nix
    ./services

    ../common/global
    ../common/users/joka

    ./kernel.nix
  ];

  networking = {
    hostName = "strix";
    useDHCP = true;
  };
  system.stateVersion = "23.05";
  # Slows down write operations considerably
  nix.settings.auto-optimise-store = false;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
}


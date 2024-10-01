{
  company = {
    autoUpgrade = {
      enable = true;
      dates = "hourly";
      flake = "github:JosefKatic/nix-config"; # Is used for home-manager-setup
      oldFlakeRef = "self";
    };
  };
}

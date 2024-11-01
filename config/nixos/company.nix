{inputs, ...}: {
  company = {
    autoUpgrade = {
      enable = inputs.self ? rev;
      dates = "hourly";
      flake = "github:JosefKatic/nix-config"; # Is used for home-manager-setup
      oldFlakeRef = "self";
    };
  };
}

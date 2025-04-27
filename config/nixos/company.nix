{inputs, ...}: {
  company = {
    autoUpgrade = {
      enable = inputs.self ? rev;
      dates = "*:0/10";
      flake = "github:JosefKatic/nix-config"; # Is used for home-manager-setup
      oldFlakeRef = "self";
      system.enable = true;
      user.enable = true;
    };
  };
}

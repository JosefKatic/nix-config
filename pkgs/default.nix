{ pkgs ? import <nixpkgs> { config.allowUnfree = true; } }: rec {

  # Packages with an actual source
  # lando = pkgs.callPackage ./lando { };
  shellcolord = pkgs.callPackage ./shellcolord { };
  speedtestpp = pkgs.callPackage ./speedtestpp { };
  trekscii = pkgs.callPackage ./trekscii { };

  # Personal scripts
  nix-inspect = pkgs.callPackage ./nix-inspect { };
  minicava = pkgs.callPackage ./minicava { };
  nordpass = pkgs.callPackage ./nordpass { };
  nordvpn = pkgs.callPackage ./nordvpn { };
  pass-wofi = pkgs.callPackage ./pass-wofi { };
  primary-xwayland = pkgs.callPackage ./primary-xwayland { };
  tly = pkgs.callPackage ./tly { };
  wl-mirror-pick = pkgs.callPackage ./wl-mirror-pick { };
  xpo = pkgs.callPackage ./xpo { };
  hyprslurp = pkgs.callPackage ./hyprslurp { };

  # My slightly customized plymouth theme, just makes the blue outline white
  plymouth-spinner-monochrome = pkgs.callPackage ./plymouth-spinner-monochrome { };

  xwaylandvideobridge = pkgs.callPackage ./xwaylandvideobridge { };
}

{ pkgs ? import <nixpkgs> { } }: rec {

  # Packages with an actual source
  # lando = pkgs.callPackage ./lando { };
  shellcolord = pkgs.callPackage ./shellcolord { };
  speedtestpp = pkgs.callPackage ./speedtestpp { };
  sitespeedio = pkgs.callPackage ./sitespeedio { };
  trekscii = pkgs.callPackage ./trekscii { };
  qt6gtk2 = pkgs.qt6Packages.callPackage ./qt6gtk2 { };

  # Personal scripts
  minicava = pkgs.callPackage ./minicava { };
  nordvpn = pkgs.callPackage ./nordvpn { };
  pass-wofi = pkgs.callPackage ./pass-wofi { };
  primary-xwayland = pkgs.callPackage ./primary-xwayland { };
  wl-mirror-pick = pkgs.callPackage ./wl-mirror-pick { };
  xpo = pkgs.callPackage ./xpo { };
  hyprslurp = pkgs.callPackage ./hyprslurp { };

  # My slightly customized plymouth theme, just makes the blue outline white
  plymouth-spinner-monochrome = pkgs.callPackage ./plymouth-spinner-monochrome { };

  xwaylandvideobridge = pkgs.callPackage ./xwaylandvideobridge { };
}

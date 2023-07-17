{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./brave.nix
    ./deluge.nix
    ./firefox.nix
    ./font.nix
    ./gtk.nix
    ./kdeconnect.nix
    ./nautilus.nix
    ./pavucontrol.nix
    ./qt.nix
  ];

  xdg.mimeApps.enable = true;
  home.packages = with pkgs; [
    xdg-utils-spawn-terminal
  ];
}

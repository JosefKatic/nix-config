{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./brave.nix
    ./discord.nix
    ./firefox
    ./font.nix
    ./gtk.nix
    ./kdeconnect.nix
    ./nautilus.nix
    ./obs.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./qt.nix
    ./vscode.nix
    ./youtube-music.nix
  ];

  xdg.mimeApps.enable = true;
  home.packages = with pkgs; [
    xdg-utils-spawn-terminal
  ];
}

{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./brave.nix
    ./discord.nix
    ./firefox.nix
    ./font.nix
    ./gtk.nix
    ./kdeconnect.nix
    ./nautilus.nix
    ./obs.nix
    ./pavucontrol.nix
    ./qt.nix
    ./vscode.nix
  ];

  xdg.mimeApps.enable = true;
  home.packages = with pkgs; [
    xdg-utils-spawn-terminal
  ];
}

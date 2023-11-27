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
    ./nordpass.nix
    ./obs.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./qt.nix
    ./teamspeak.nix
    ./vscode.nix
    ./youtube-music.nix
  ] ;
  xdg.portal.enable = true;
}

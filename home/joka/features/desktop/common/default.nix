{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./firefox
    ./font.nix
    ./gtk.nix
    ./kdeconnect.nix
    ./nautilus.nix
    ./pavucontrol.nix
    ./playerctl.nix
    ./qt.nix
    ./vscode.nix
    ./youtube-music.nix
   
  #  Non aarch64 TODO
    ./discord.nix
    ./nordpass.nix
    ./obs.nix
    ./teamspeak.nix
  ];
  xdg.portal.enable = true;
}

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
  ] ++ (lib.optionals (pkgs.system != "aarch64-linux") [
    ./discord.nix
    ./nordpass.nix
    ./obs.nix
    ./teamspeak.nix
  ]);
  xdg.portal.enable = true;
}

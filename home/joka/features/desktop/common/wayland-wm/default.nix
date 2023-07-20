{ config, pkgs, lib, ... }:
let

in {
  imports = [
    ./hyprland-vnc.nix
    ./gammastep.nix
    ./mako.nix
    ./kitty.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
    ./wofi.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    grim
    imv
    mimeo
    primary-xwayland
    pulseaudio
    slurp
    waypipe
    wf-recorder
    wl-clipboard
    wl-mirror
    wl-mirror-pick
    ydotool
  ];

  home.sessionVariables = {
    GDK_BACKEND = "wayland,x11";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    WLR_RENDERER_ALLOW_SOFTWARE = 1;
    MOZ_ENABLE_WAYLAND = 1;
    LIBSEAT_BACKEND = "logind";
    NIXOS_OZONE_WL = "1";
  };
}

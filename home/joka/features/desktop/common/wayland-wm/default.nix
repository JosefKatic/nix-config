{ config, pkgs, lib, ... }: {
  imports = [
    ./hyprland-vnc.nix
    ./gammastep.nix
    ./mako.nix
    ./kitty.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
    # ./wezterm.nix
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
    xdg-utils-spawn-terminal # Patched to open terminal
    ydotool
  ];
  xdg.mimeApps.enable = true;
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    LIBSEAT_BACKEND = "logind";
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
}

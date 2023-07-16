{ pkgs, ... }:
{
  imports = [
    ./gammastep.nix
    ./mako.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
    ./wofi.nix
    ./wezterm.nix
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
    WLR_NO_HARDWARE_CURSORS = 1;
    WLR_RENDERER_ALLOW_SOFTWARE = 1;
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
    LIBSEAT_BACKEND = "logind";
    NIXOS_OZONE_WL = "1";
  };
}

{ pkgs, lib, config, ... }:
let
  homeCfgs = config.home-manager.users;
  homePaths = lib.mapAttrsToList (n: v: "${v.home.path}/share") homeCfgs;
  extraDataPaths = lib.concatStringsSep ":" homePaths;
  vars = ''WLR_NO_HARDWARE_CURSORS=1 XDG_DATA_DIRS="$XDG_DATA_DIRS:${extraDataPaths}"'';
  nvidiaEnabled = (lib.elem "nvidia" config.services.xserver.videoDrivers);
  swayParams = 
  if nvidiaEnabled 
  then "--unsupported-gpu"
  else
    "";
  swayKiosk = command: "${pkgs.sway}/bin/sway ${swayParams} --config ${pkgs.writeText "kiosk.config" ''
    output * bg #000000 solid_color
    exec "dbus-update-activation-envi  ronment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK"
    xwayland disable
    input "type:touchpad" {
      tap enabled
    }
    exec '${vars} ${command} -l debug; ${pkgs.sway}/bin/swaymsg exit'
  ''}";

  jokaCfg = homeCfgs.joka;
in
{
  users.extraUsers.greeter.packages = [
    jokaCfg.gtk.theme.package
    jokaCfg.gtk.iconTheme.package
  ];

  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        icon_theme_name = "ePapirus";
        theme_name = jokaCfg.gtk.theme.name;
      };
      background = {
        path = jokaCfg.wallpaper;
        fit = "Cover";
      };
    };
  };
  services.greetd = {
    enable = true;
    settings.default_session.command = swayKiosk (lib.getExe config.programs.regreet.package);
  };
}

# { pkgs, lib, config, ... }: {
#   services.greetd = {
#     enable = true;
#     settings.default_session = {
#         command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
#         user = "greeter";
#     };
#   };

#   systemd.services.greetd.serviceConfig = {
#     Type = "idle";
#     StandardInput = "tty";
#     StandardOutput = "tty";
#     StandardError = "journal"; # Without this errors will spam on screen
#     # Without these bootlogs will spam on screen
#     TTYReset = true;
#     TTYVHangup = true;
#     TTYVTDisallocate = true;
#   };
#   environment.etc."greetd/environments".text = ''
#     Hyprland
#     fish
#   '';
#   security.pam.services.greetd.enableGnomeKeyring = true;
# }


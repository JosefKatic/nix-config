#  { pkgs, lib, config, ... }: {
#    services.greetd = {
#      enable = true;
#      settings.default_session = {
#          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
#          user = "greeter";
#      };
#    };
#    systemd.services.greetd.serviceConfig = {
#      Type = "idle";
#      StandardInput = "tty";
#      StandardOutput = "tty";
#      StandardError = "journal"; # Without this errors will spam on screen
#      # Without these bootlogs will spam on screen
#      TTYReset = true;
#      TTYVHangup = true;
#      TTYVTDisallocate = true;
#    };
#    environment.etc."greetd/environments".text = ''
#      Hyprland
#      fish
#    '';
#    security.pam.services.greetd.enableGnomeKeyring = true;
# }

{ pkgs, lib, config, ... }:
let
  homeCfgs = config.home-manager.users;
  homeSharePaths = lib.mapAttrsToList (n: v: "${v.home.path}/share") homeCfgs;
  vars = ''XDG_DATA_DIRS="$XDG_DATA_DIRS:${lib.concatStringsSep ":" homeSharePaths}"'';

  # TODO: this should not be coupled to my home config
  # Or at least have some kind of fallback values if it's not present on this machine
  jokaCfg = homeCfgs.joka;
  gtkTheme = jokaCfg.gtk.theme;
  iconTheme = jokaCfg.gtk.iconTheme;
  wallpaper = jokaCfg.wallpaper;

  sway-kiosk = command: "${lib.getExe pkgs.sway} --unsupported-gpu --config ${pkgs.writeText "kiosk.config" ''
    output * bg #000000 solid_color
    xwayland disable
    input "type:touchpad" {
      tap enabled
    }
    exec 'WLR_NO_HARDWARE_CURSORS=1 GTK_USE_PORTAL=0 ${vars} ${command}; ${pkgs.sway}/bin/swaymsg exit'
  ''}";
in
{

 users.extraUsers.greeter = {
    packages = [
      gtkTheme.package
      iconTheme.package
    ];
    # For caching and such
    home = "/tmp/greeter-home";
    createHome = true;
  };

  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        icon_theme_name = "Papirus";
        theme_name = gtkTheme.name;
      };
      background = {
        path = wallpaper;
        fit = "Cover";
      };
    };
  };
  services.greetd = {
    enable = true;
    settings.default_session.command = sway-kiosk (lib.getExe config.programs.regreet.package);
  };
  security.pam.services.greetd.enableGnomeKeyring = true;
}

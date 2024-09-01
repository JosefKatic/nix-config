{
  pkgs,
  inputs,
  ...
}: {
  user = {
    name = "joka";
    desktop = {
      programs = {
        browsers = {
          firefox.enable = true;
          chromium.enable = true;
        };
        editors = {
          vscode.enable = true;
        };
        emulators = {
          kitty.enable = true;
        };
        games = {
          lutris.enable = true;
          minecraft.enable = true;
        };
        media = {
          mpv.enable = true;
        };
      };

      services = {
        kdeconnect.enable = true;
        mako.enable = true;
        polkit-agent.enable = true;
        rnnoise.enable = true;
      };

      wayland = {
        hyprland = {
          enable = true;
          services = {
            anyrun.enable = true;
            hypridle.enable = true;
            hyprlock.enable = true;
            hyprpaper.enable = true;
          };
          plugins = {
            hyprsplit.enable = true;
          };
        };
        waybar = {
          enable = true;
        };
      };
      gtk.enable = true;
      monitors = [
        {
          name = "DP-1";
          width = 2560;
          height = 1440;
          x = 2560;
          primary = true;
        }
        {
          name = "DP-2";
          width = 2560;
          height = 1440;
          x = 0;
        }
      ];
    };
    services = {
      media.playerctl.enable = true;
      system.udiskie.enable = true;
    };
    terminal = {
      shell.fish.enable = true;
    };
  };
  theme = rec {
    wallpaper = inputs.joka00-modules.legacyPackages.${pkgs.system}.wallpapers.astronaut-minimalism;
  };
}
{
  pkgs,
  inputs,
  ...
}: {
  user = {
    name = "joka-ipa";
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
        polkit_agent.enable = true;
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
          name = "eDP-1";
          width = 1920;
          height = 1080;
          primary = true;
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
  theme = {
    wallpaper = inputs.joka00-modules.legacyPackages.${pkgs.system}.wallpapers.deer.outPath;
    colorscheme.type = "monochrome";
  };
}

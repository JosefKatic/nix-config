{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./features/desktop/hyprland
    ./features/desktop/wireless
    ./features/productivity
    ./features/pass
    ./features/games
    ./features/music
  ];


  colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  wallpaper = outputs.wallpapers.astronaut-minimalism;
  # wallpaper = outputs.wallpapers.ringed-planet-cartoon;

  #  -------
  # | DP-1 |
  # -------
  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      x = 0;
      y = 1080;
      primary = true;
    }
    {
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      x = 0;
      y = 0;
      noBar = true;
    }
  ];
  workspaces = [
    {
      id = 1;
      monitor = "eDP-1";
      default = true;
    }
    {
      id = 2;
      monitor = "eDP-1";
    }
    {
      id = 3;
      monitor = "eDP-1";
    }
    {
      id = 4;
      monitor = "eDP-1";
    }
    {
      id = 5;
      monitor = "eDP-1";
    }
    {
      id = 6;
      monitor = "eDP-1";
    }
    {
      id = 7;
      monitor = "eDP-1";
    }
    {
      id = 8;
      monitor = "eDP-1";
    }
    {
      id = 9;
      monitor = "eDP-1";
    }
    {
      id = 10;
      monitor = "eDP-1";
    }
    {
      id = 11;
      monitor = "HDMI-A-1";
      default = true;
    }
    {
      id = 12;
      monitor = "HDMI-A-1";
    }
    {
      id = 13;
      monitor = "HDMI-A-1";
    }
    {
      id = 14;
      monitor = "HDMI-A-1";
    }
    {
      id = 15;
      monitor = "HDMI-A-1";
    }
    {
      id = 16;
      monitor = "HDMI-A-1";
    }
    {
      id = 17;
      monitor = "HDMI-A-1";
    }
    {
      id = 18;
      monitor = "HDMI-A-1";
    }
    {
      id = 19;
      monitor = "HDMI-A-1";
    }
    {
      id = 20;
      monitor = "HDMI-A-1";
    }
  ];
}

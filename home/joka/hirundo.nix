{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./features/desktop/hyprland
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
  ];
}

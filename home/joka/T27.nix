{ inputs, ... }: {
  imports = [
    ./global
    ./features/desktop/hyprland
    ./features/rgb
    ./features/productivity
    ./features/pass
    ./features/games
    ./features/music
  ];

  colorscheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  #  ------   -----   ------
  # | DP-3 | | DP-1| | DP-2 |
  #  ------   -----   ------
  monitors = [
    {
      name = "DP-1";
      width = 2560;
      height = 1440;
      x = 2560;
      workspace = "1";
    }
    {
      name = "DP-2";
      width = 2560;
      height = 1440;
      noBar = true;
      x = 0;
      workspace = "11";
    }
  ];
}

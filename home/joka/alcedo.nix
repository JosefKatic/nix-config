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
  # TODO: Make nvidia environment automatic
  home.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    __GL_VRR_ALLOWED = 0;
    WLR_DRM_NO_ATOMIC = 1;
    WLR_NO_HARDWARE_CURSORS = 1;
  };
  #  -------  -------
  # | DP-3 | | DP-2 |
  # -------  -------
  monitors = [
    {
      name = "DP-2";
      width = 2560;
      height = 1440;
      x = 2560;
      workspaces = [
        {
          id = 1;
          monitor = "DP-2";
          default = true;
        }
        {
          id = 2;
          monitor = "DP-2";
        }
        {
          id = 3;
          monitor = "DP-2";
        }
        {
          id = 4;
          monitor = "DP-2";
        }
        {
          id = 5;
          monitor = "DP-2";
        }
        {
          id = 6;
          monitor = "DP-2";
        }
        {
          id = 7;
          monitor = "DP-2";
        }
        {
          id = 8;
          monitor = "DP-2";
        }
        {
          id = 9;
          monitor = "DP-2";
        }
        {
          id = 10;
          monitor = "DP-2";
        }
      ];    
    }
    {
      name = "DP-3";
      width = 2560;
      height = 1440;
      noBar = true;
      x = 0;
      workspaces = [
        {
          id = 11;
          monitor = "DP-3";
          default = true;
        }
        {
          id = 12;
          monitor = "DP-3";
        }
        {
          id = 13;
          monitor = "DP-3";
        }
        {
          id = 14;
          monitor = "DP-3";
        }
        {
          id = 15;
          monitor = "DP-3";
        }
        {
          id = 16;
          monitor = "DP-3";
        }
        {
          id = 17;
          monitor = "DP-3";
        }
        {
          id = 18;
          monitor = "DP-3";
        }
        {
          id = 19;
          monitor = "DP-3";
        }
        {
          id = 20;
          monitor = "DP-3";
        }
      ];
    }
  ];

}

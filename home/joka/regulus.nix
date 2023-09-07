{ inputs, outputs, ... }: {

  # Add hyprland
  imports = [ 
    ./global
    # ./features/desktop/hyprland
    # ./features/desktop/wireless
    # ./features/productivity
    # ./features/pass
  ];

  # wallpaper = outputs.wallpapers.aenami-lunar;
  colorscheme = inputs.nix-colors.colorSchemes.nord;
  # monitors = [
  #   {
  #     name = "HDMI-A-1";
  #     width = 1920;
  #     height = 1080;
  #     x = 0;
  #     y = 0;
  #     primary = true;
  #   }
  # ];
  # workspaces = [
  #   {
  #     id = 1;
  #     monitor = "HDMI-A-1";
  #     default = true;
  #   }
  #   {
  #     id = 2;
  #     monitor = "HDMI-A-1";
  #   }
  #   {
  #     id = 3;
  #     monitor = "HDMI-A-1";
  #   }
  #   {
  #     id = 4;
  #     monitor = "HDMI-A-1";
  #   }
  #   {
  #     id = 5;
  #     monitor = "HDMI-A-1";
  #   }
  #   {
  #     id = 6;
  #     monitor = "HDMI-A-1";
  #   }
  #   {
  #     id = 7;
  #     monitor = "HDMI-A-1";
  #   }
  #   {
  #     id = 8;
  #     monitor = "HDMI-A-1";
  #   }
  #   {
  #     id = 9;
  #     monitor = "HDMI-A-1";
  #   }
  #   {
  #     id = 10;
  #     monitor = "HDMI-A-1";
  #   }
  # ];
}

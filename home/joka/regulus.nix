{ inputs, outputs, ... }: {

  # Add hyprland
  imports = [ 
    ./global
    # ./features/desktop/hyprland
    # ./features/desktop/wireless
    # ./features/productivity
    # ./features/pass
  ];

  colorscheme = inputs.nix-colors.colorSchemes.nord;
}

{
  pkgs,
  inputs,
  ...
}: {
  theme = rec {
    wallpaper = inputs.joka00-modules.legacyPackages.${pkgs.system}.wallpapers.astronaut-minimalism.outPath;
    colorscheme.type = "content";
  };
  user = {
    name = "joka";
    desktop.monitors = [
      {
        name = "DP-1";
        width = 2560;
        height = 1440;
        position = "auto-left";
        workspace = "1";
      }
      {
        name = "DP-2";
        width = 2560;
        height = 1440;
        primary = true;
        workspace = "11";
      }
    ];
    desktop.programs.productivity.proton.pass.enable = true;
    desktop.programs.productivity.proton.mail.enable = true;
  };
}

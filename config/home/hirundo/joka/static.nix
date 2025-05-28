{
  inputs,
  pkgs,
  ...
}: {
  theme = {
    wallpaper = inputs.joka00-modules.legacyPackages.${pkgs.system}.wallpapers.binary-black.outPath;
  };
  user = {
    name = "joka";
    desktop.monitors = [
      {
        name = "eDP-1";
        width = 1920;
        height = 1080;
        primary = true;
        workspace = "1";
      }
    ];
  };
}

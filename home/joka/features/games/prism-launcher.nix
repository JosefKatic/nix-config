{ pkgs, lib, ... }: {
  home.packages = [ pkgs.prismlauncher-qt5 ];

  home.persistence = {
    "/persist/home/joka".directories = [ ".local/share/PrismLauncher" ];
  };
}

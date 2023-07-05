{ pkgs, lib, ... }: {
  home.packages = [ pkgs.osu-lazer ];

  home.persistence = {
    "/persist/home/joka".directories = [ ".local/share/osu" ];
  };
}

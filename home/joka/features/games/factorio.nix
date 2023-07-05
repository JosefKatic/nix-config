{ lib, pkgs, ... }: {
  home = {
    packages = [ pkgs.factorio ];
    persistence = {
      "/persist/home/joka" = {
        allowOther = true;
        directories = [ ".factorio" ];
      };
    };
  };
}

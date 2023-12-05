{pkgs, lib, ... }: {
  home.packages = (lib.optionals (pkgs.system != "aarch64-linux") [
    pkgs.nordpass
  ]);
}
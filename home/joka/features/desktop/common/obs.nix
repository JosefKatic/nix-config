{pkgs, lib, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = (lib.optionals (pkgs.system != "aarch64-linux") [
      pkgs.obs-studio-plugins.wlrobs
      pkgs.obs-studio-plugins.obs-pipewire-audio-capture
    ]);
  };
}
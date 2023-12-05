{pkgs, ...}: {
  services.trezord.enable = true;
  home.packages = with pkgs; [ trezor-suite ];
}
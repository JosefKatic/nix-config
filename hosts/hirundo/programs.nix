{ pkgs, ... } : {

  programs = {
    adb.enable = true;
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  environment.systemPackages = with pkgs; [
    libgnome-keyring
    libsecret
    curl
    rustup
  ];
}
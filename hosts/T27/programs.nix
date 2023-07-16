{ pkgs, ... } : {

  programs = {
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    libgnome-keyring
    libsecret
    curl
    rustup
  ];
}
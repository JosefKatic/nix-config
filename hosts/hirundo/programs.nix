{ pkgs, ... } : {

  programs = {
    light.enable = true;
    adb.enable = true;
    dconf.enable = true;
    kdeconnect.enable = true;
  };

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };

  environment.systemPackages = with pkgs; [
    libgnome-keyring
    libsecret
    curlFull
    rustup
  ];
}
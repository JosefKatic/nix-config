{ config, pkgs, lib, ... }: {
  services.pcscd.enable = true;
  
  sops.secrets.u2f-key = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  security.pam.u2f = {
    enable = true;
    origin = "pam://joka00.dev";
    appId = "pam://joka00.dev";
    interactive = true;
    authFile = "${config.sops.secrets.u2f-key.path} [cue_prompt=🔑 Tap the key...]";
    cue = true;
  };
  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };
}
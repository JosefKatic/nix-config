{ config, pkgs, lib, ... }: {
  services.pcscd.enable = true;
  
  sops.secrets.u2f-key = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  security.pam.u2f = {
    enable = true;
    authFile = "${config.sops.secrets.u2f-key.path} origin=pam://joka00.dev appid=pam://joka00.dev cue [cue_prompt=🔑 Tap the key...]";
    cue = true;
  };
  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };
}
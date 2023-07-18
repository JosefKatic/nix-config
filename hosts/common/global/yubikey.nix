{ config, pkgs, lib, ... }: 
let
  inherit (config.networking) hostName;
in
{
  services.pcscd.enable = true;
  
  sops.secrets.u2f-key = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  security.pam.u2f = {
    enable = true;
    authFile = "${config.sops.secrets.u2f-key.path} origin=pam://${hostName} cue [cue_prompt=🔑 Tap the key...]";
    cue = true;
  };
  security.pam.services = {
    login.u2fAuth = false;
    sudo.u2fAuth = true;
  };
}
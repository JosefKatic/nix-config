{ config, lib, ... }: {
  # Wireless secrets stored through sops
  sops.secrets.wireless = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  networking.wireless = {
    enable = true;
    fallbackToWPA2 = false;
    # Declarative
    environmentFile = config.sops.secrets.wireless.path;
    networks = {
      "@home_ssid@" = {
        pskRaw = "@home_psk@";
      };
      "@flat_ssid@" = {
        pskRaw = "@flat_psk@";
      };
      "@mobile_ssid@" = {
        pskRaw = "@mobile_psk@";
      };
      "CDWiFi" = {
        auth = ''
          key_mgmt=NONE
        '';
      };
      "eduroam" = {
        auth = ''
          key_mgmt=WPA-EAP
          pairwise=CCMP
          auth_alg=OPEN
          eap=TTLS
          identity="@eduroam_login@"
          password="@eduroam_psk@"
          phase2="auth=MSCHAPV2"
        '';
      };
    };

    # Imperative
    allowAuxiliaryImperativeNetworks = true;
    userControlled = {
      enable = true;
      group = "network";
    };
    extraConfig = ''
      update_config=1
    '';
  };

  # Ensure group exists
  users.groups.network = { };

  systemd.services.wpa_supplicant.preStart = "touch /etc/wpa_supplicant.conf";
}

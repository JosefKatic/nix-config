{
  systemd.network.enable = true;
  networking = {
    hostName = "hirundo";
    useNetworkd = true;
    firewall = {
      enable = true;
      checkReversePath = "loose";
    };
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };
}
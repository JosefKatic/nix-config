{
   systemd.network.enable = true;
   networking = {
    hostName = "T27";
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
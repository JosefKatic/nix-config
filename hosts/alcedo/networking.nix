{
   systemd.network.enable = true;
   networking = {
    hostName = "alcedo";
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
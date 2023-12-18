{ pkgs, ... }: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [ 
      samsung-unified-linux-driver
      splix
      hplip
     ];
  };
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  # for a WiFi printer
  services.avahi.openFirewall = true;
}
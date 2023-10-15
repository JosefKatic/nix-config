{ lib, ... }:
{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = lib.mkDefault "client";
  };
  services.resolved.enable = true;
  networking.firewall = {
    checkReversePath = "loose";
    allowedUDPPorts = [ 41641 ]; # Facilitate firewall punching
  };
  networking.firewall.trustedInterfaces = [ "tailscale0" ];

  environment.persistence = {
    "/persist".directories = [ "/var/lib/tailscale" ];
  };
}
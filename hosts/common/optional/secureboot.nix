{config, pkgs, lib, ...}: 
let
  hasOptinPersistence = config.environment.persistence ? "/persist";
in {
  boot = {
    bootspec.enable = true;
    loader = {
      systemd-boot = (lib.mkIf config.boot.lanzaboote.enable) {
        enable = lib.mkForce false;
        consoleMode = "max";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "${lib.optionalString hasOptinPersistence "/persist"}/etc/secureboot";
    };
  };
}
{ config, inputs, lib, pkgs, ... }:
let
  hasOptinPersistence = config.environment.persistence ? "/persist";
in
{
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];
  boot = {
    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
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
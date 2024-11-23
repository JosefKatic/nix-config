{
  pkgs,
  lib,
  ...
}: {
  device.core.locale.defaultLocale = "en_US.UTF-8";
  device.core.locale.supportedLocales = ["en_US.UTF-8/UTF-8" "cs_CZ.UTF-8/UTF-8"];
  device.core.locale.timeZone = "Europe/Prague";
  device.core.network.domain = "clients.joka00.dev";
  device.core.network.services.enableAvahi = false;
  device.core.network.services.enableNetworkManager = false;
  device.core.network.services.enableResolved = false;
  device.core.securityRules.enable = false;
  device.core.shells.fish.enable = true;
  device.core.storage.enablePersistence = true;
  device.core.storage.otherDrives = [];
  device.core.storage.swapFile.enable = true;
  device.core.storage.swapFile.path = "/swap/swapfile";
  device.core.storage.swapFile.size = 16;
  device.core.storage.systemDrive.encrypted.enable = false;
  device.core.storage.systemDrive.encrypted.path = "";
  device.core.storage.systemDrive.name = "system";
  device.core.storage.systemDrive.path = "/dev/disk/by-label/system";
  device.desktop.gamemode.enable = false;
  device.desktop.wayland.desktopManager.gnome.enable = false;
  device.desktop.wayland.desktopManager.plasma6.enable = false;
  device.desktop.wayland.displayManager.gdm.enable = false;
  device.desktop.wayland.windowManager.hyprland.enable = false;
  device.desktop.wayland.windowManager.sway.enable = false;
  device.server.auth.freeipa.enable = false;
  device.server.auth.keycloak.enable = false;
  device.server.cache.enable = false;
  device.server.git.daemon.enable = false;
  device.server.git.cgit.enable = false;
  device.server.hydra.enable = false;
  device.server.hosting.website.enable = false;
  device.server.minecraft.enable = false;
  device.server.teamspeak.enable = false;
  device.server.databases.mysql.enable = false;
  device.server.databases.postgresql.enable = false;
  device.server.services.web.acme.enable = false;
  device.server.services.web.nginx.enable = false;
  device.server.services.fail2ban.enable = false;
  device.utils.kdeconnect.enable = false;
  device.utils.virtualisation.docker.enable = false;
  device.utils.virtualisation.libvirtd.enable = false;
  device.utils.virtualisation.podman.enable = false;
}

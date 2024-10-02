{
  nixpkgs.hostPlatform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["ata_piix" "sr_mod" "uhci_hcd" "virtio_blk" "virtio_pci"];
  device.type = "server";
  device.virtualized = true;
  device.build = "FmK7W5o44OWWB0mBXr2xjSUn+4Q=";
  device.boot.quietboot.enable = false;
  device.boot.uefi.enable = false;
  device.boot.uefi.secureboot = false;
  device.home.users = ["joka" "joka-ipa"];
  device.core.disableDefaults = true;
  device.core.locale.defaultLocale = "en_US.UTF-8";
  device.core.locale.supportedLocales = ["en_US.UTF-8/UTF-8" "cs_CZ.UTF-8/UTF-8"];
  device.core.locale.timeZone = "Europe/Prague";
  device.core.network.domain = "clients.joka00.dev";
  device.core.network.services.enableAvahi = false;
  device.core.network.services.enableNetworkManager = false;
  device.core.network.services.enableResolved = false;
  device.core.securityRules.enable = true;
  device.core.shells.fish.enable = true;
  device.core.shells.zsh.enable = false;
  device.core.storage.enablePersistence = true;
  device.core.storage.otherDrives = [];
  device.core.storage.swapFile.enable = true;
  device.core.storage.swapFile.path = "/swap/swapfile";
  device.core.storage.swapFile.size = 4;
  device.core.storage.systemDrive.encrypted.enable = false;
  device.core.storage.systemDrive.encrypted.path = "";
  device.core.storage.systemDrive.name = "system";
  device.core.storage.systemDrive.path = "/dev/disk/by-label/system";
  device.desktop.gamemode.enable = false;
  device.desktop.wayland.desktopManager.gnome.enable = false;
  device.desktop.wayland.desktopManager.plasma6.enable = false;
  device.desktop.wayland.displayManager.gdm.enable = false;
  device.desktop.wayland.displayManager.regreet.enable = false;
  device.desktop.wayland.displayManager.regreet.themes.cursor.name = "";
  device.desktop.wayland.displayManager.regreet.themes.cursor.package = "";
  device.desktop.wayland.displayManager.regreet.themes.gtk.name = "";
  device.desktop.wayland.displayManager.regreet.themes.gtk.package = "";
  device.desktop.wayland.displayManager.regreet.themes.icons.name = "";
  device.desktop.wayland.displayManager.regreet.themes.icons.package = "";
  device.desktop.wayland.windowManager.hyprland.enable = false;
  device.desktop.wayland.windowManager.sway.enable = false;
  device.hardware.bluetooth.enable = false;
  device.hardware.bluetooth.enableManager = false;
  device.hardware.cpu.amd.enable = false;
  device.hardware.cpu.intel.enable = true;
  device.hardware.disks.hdd.enable = false;
  device.hardware.disks.ssd.enable = true;
  device.hardware.gpu.amd.enable = false;
  device.hardware.gpu.intel.enable = false;
  device.hardware.gpu.nvidia.enable = false;
  device.hardware.misc.trezor.enable = false;
  device.hardware.misc.xbox.enable = false;
  device.hardware.misc.yubikey.enable = false;
  device.server.auth.freeipa.enable = false;
  device.server.auth.keycloak.enable = false;
  device.server.cache.enable = false;
  device.server.git.daemon.enable = true;
  device.server.git.cgit.enable = true;
  device.server.hydra.enable = false;
  device.server.hosting.website.enable = true;
  device.server.minecraft.enable = false;
  device.server.teamspeak.enable = false;
  device.server.databases.mysql.enable = false;
  device.server.databases.postgresql.enable = true;
  device.server.services.web.acme.enable = true;
  device.server.services.web.nginx.enable = true;
  device.server.services.fail2ban.enable = true;
  device.utils.kdeconnect.enable = false;
  device.utils.virtualisation.docker.enable = false;
  device.utils.virtualisation.libvirtd.enable = false;
  device.utils.virtualisation.podman.enable = false;
}

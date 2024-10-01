
    # STATIC PART OF NIXOS CONFIG
    
    # STATIC PART OF NIXOS CONFIG
    
    # STATIC PART OF NIXOS CONFIG
    {
  nixpkgs.hostPlatform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
  powerManagement.cpuFreqGovernor = "powersave";
  services.nordvpn.enable = true;
  device = {
    type = "laptop";
    virtualized = false;
    build = "FmK7W5o44OWWB0mBXr2xjSUn+4Q=";
    boot = {
      quietboot = {enable = true;};
      uefi = {
        enable = true;
        secureboot = true;
      };
    };
    home = {
      users = ["joka" "joka-ipa"];
      init = {
        url = "https://github.com/JosefKatic/nix-config";
      };
    };
    core = {
      disableDefaults = true;
      locale = {
        defaultLocale = "en_US.UTF-8";
        supportedLocales = ["en_US.UTF-8/UTF-8" "cs_CZ.UTF-8/UTF-8"];
        timeZone = "Europe/Prague";
      };
      network = {
        domain = "clients.joka00.dev";
        services = {
          enableAvahi = true;
          enableNetworkManager = true;
          enableResolved = true;
        };
      };
      securityRules = {enable = true;};
      shells = {
        fish = {enable = true;};
        zsh = {enable = false;};
      };
      storage = {
        enablePersistence = true;
        otherDrives = [];
        swapFile = {
          enable = true;
          path = "/swap/swapfile";
          size = 18;
        };
        systemDrive = {
          encrypted = {
            enable = true;
            path = "/dev/disk/by-partlabel/cryptsystem";
          };
          name = "system";
          path = "/dev/disk/by-label/system";
        };
      };
    };
    desktop = {
      gamemode = {enable = true;};
      wayland = {
        desktopManager = {
          gnome = {enable = false;};
          plasma6 = {enable = false;};
        };
        displayManager = {
          gdm = {enable = true;};
          regreet = {
            enable = false;
            themes = {
              cursor = {
                name = "";
                package = "";
              };
              gtk = {
                name = "";
                package = "";
              };
              icons = {
                name = "";
                package = "";
              };
            };
          };
        };
        windowManager = {
          hyprland = {enable = true;};
          sway = {enable = false;};
        };
      };
    };
    hardware = {
      bluetooth = {
        enable = true;
        enableManager = true;
      };
      cpu = {
        amd = {enable = true;};
        intel = {enable = false;};
      };
      disks = {
        hdd = {enable = false;};
        ssd = {enable = true;};
      };
      gpu = {
        amd = {enable = true;};
        intel = {enable = false;};
        nvidia = {enable = false;};
      };
      misc = {
        trezor = {enable = true;};
        xbox = {enable = true;};
        yubikey = {enable = true;};
      };
    };
    server = {
      services = {
      };
    };
    utils = {
      kdeconnect = {enable = true;};
      virtualisation = {
        docker = {enable = true;};
        libvirtd = {enable = true;};
        podman = {enable = false;};
      };
    };
  };
}

    
    
    # GENERATED BY WEB-CONFIG

    device.boot.quietboot.enable = true;
device.boot.uefi.enable = true;
device.boot.uefi.secureboot = true;
device.core.disableDefaults = true;
device.core.locale.defaultLocale = "en_US.UTF-8";
device.core.locale.supportedLocales = ["en_US.UTF-8/UTF-8" "cs_CZ.UTF-8/UTF-8"];
device.core.locale.timeZone = "Europe/Prague";
device.core.network.domain = "clients.joka00.dev";
device.core.network.services.enableNetworkManager = true;
device.core.network.services.enableAvahi = true;
device.core.network.services.enableResolved = true;
device.core.securityRules.enable = true;
device.core.shells.fish.enable = true;
device.core.shells.zsh.enable = true;
device.core.storage.enablePersistence = true;
device.core.storage.systemDrive.name = "system";
device.core.storage.systemDrive.path = "/dev/disk/by-label/system";
device.core.storage.systemDrive.encrypted.enable = true;
device.core.storage.systemDrive.encrypted.path = "/dev/disk/by-partlabel/cryptsystem";
device.core.storage.swapFile.enable = true;
device.core.storage.swapFile.path = "/swap/swapfile";
device.core.storage.swapFile.size = 18;
device.desktop.gamemode.enable = true;
device.desktop.wayland.desktopManager.gnome.enable = false;
device.desktop.wayland.desktopManager.plasma6.enable = false;
device.desktop.wayland.displayManager.regreet.enable = false;
device.desktop.wayland.displayManager.gdm.enable = true;
device.desktop.wayland.windowManager.hyprland.enable = true;
device.desktop.wayland.windowManager.sway.enable = true;
device.hardware.bluetooth.enable = true;
device.hardware.bluetooth.enableManager = false;
device.hardware.cpu.intel.enable = false;
device.hardware.cpu.amd.enable = true;
device.hardware.gpu.intel.enable = false;
device.hardware.gpu.amd.enable = true;
device.hardware.gpu.nvidia.enable = false;
device.hardware.disks.ssd.enable = true;
device.hardware.disks.hdd.enable = false;
device.hardware.misc.trezor.enable = true;
device.hardware.misc.xbox.enable = true;
device.hardware.misc.yubikey.enable = true;
device.server.services.acme.enable = false;
device.server.services.fail2ban.enable = true;
device.server.services.freeipaServer.enable = false;
device.server.services.keycloak.enable = false;
device.server.services.nginx.enable = false;
device.server.services.mysql.enable = false;
device.server.services.postgresql.enable = false;
device.server.services.teamspeak.enable = false;
device.server.services.headscale.enable = false;
device.server.services.headscale.port = 0;
device.server.services.web.acme.enable = false;
device.server.services.web.nginx.enable = false;
device.server.auth.freeipa.enable = false;
device.server.auth.keycloak.enable = false;
device.server.cache.enable = false;
device.server.databases.mysql.enable = false;
device.server.databases.postgresql.enable = false;
device.server.hydra.enable = true;
device.server.minecraft.enable = false;
device.server.teamspeak.enable = false;
device.server.git.cgit.enable = false;
device.server.git.daemon.enable = false;
device.server.homelab.blocky.enable = false;
device.server.homelab.enable = false;
device.server.homelab.homeassistant.enable = false;
device.server.homelab.mosquitto.enable = false;
device.server.homelab.zigbee2mqtt.enable = false;
device.server.hosting.website.enable = false;
device.utils.autoUpgrade.enable = true;
device.utils.kdeconnect.enable = true;
device.utils.virtualisation.docker.enable = true;
device.utils.virtualisation.podman.enable = false;
device.utils.virtualisation.libvirtd.enable = true;
device.build = "3aa685184afceae902f89abff29485eaa65375d5abb6b45cc524ca39c99f84c0";
device.home.users = ["joka" "joka-ipa"];
device.type = 0;
device.virtualized = false;
}
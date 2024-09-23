{
  nixpkgs.hostPlatform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["ata_piix" "sr_mod" "uhci_hcd" "virtio_blk" "virtio_pci"];

  device = {
    type = "server";
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
          enableAvahi = false;
          enableNetworkManager = false;
          enableResolved = false;
        };
        static = {
          enable = true;
          interfaces = {
            "eno2".ipv4.addresses = [
              {
                address = "10.34.70.20";
                prefixLength = 23;
              }
            ];
          };
          defaultGateway = {
            address = "10.34.70.62";
            interface = "eno2";
          };
          nameservers = ["10.34.70.20" "10.34.70.62"];
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
          size = 8;
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
      gamemode = {enable = false;};
      wayland = {
        desktopManager = {
          gnome = {enable = false;};
          plasma6 = {enable = false;};
        };
        displayManager = {
          gdm = {enable = false;};
          regreet = {
            enable = false;
          };
        };
        windowManager = {
          hyprland = {enable = false;};
          sway = {enable = false;};
        };
      };
    };
    hardware = {
      bluetooth = {
        enable = true;
        enableManager = false;
      };
      cpu = {
        amd = {enable = false;};
        intel = {enable = true;};
      };
      disks = {
        hdd = {enable = false;};
        ssd = {enable = true;};
      };
      gpu = {
        amd = {enable = false;};
        intel = {enable = true;};
        nvidia = {enable = false;};
      };
      misc = {
        trezor = {enable = false;};
        xbox = {enable = false;};
        yubikey = {enable = false;};
      };
    };
    server = {
      homelab = {
        enable = true;
        blocky.enable = true;
        homeassistant.enable = true;
        mosquitto.enable = true;
        zigbee2mqtt.enable = true;
      };
      services = {
        frigate = {enable = true;};
        web = {
          nginx = {enable = true;};
          acme = {enable = true;};
        };
      };
    };
    utils = {
      kdeconnect = {enable = false;};
      virtualisation = {
        docker = {enable = false;};
        libvirtd = {enable = false;};
        podman = {enable = true;};
      };
    };
  };
}

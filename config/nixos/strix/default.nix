{
  nixpkgs.hostPlatform = "x86_64-linux";
  boot.initrd.availableKernelModules = ["ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk"];
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
  ];
  device = {
    type = "server";
    virtualized = true;
    build = "FmK7W5o44OWWB0mBXr2xjSUn+4Q=";
    boot = {
      quietboot = {enable = false;};
      uefi = {
        enable = false;
        secureboot = false;
      };
    };
    home = {
      users = ["joka" "joka-ipa"];
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
            enable = false;
            path = "";
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
          hyprland = {enable = false;};
          sway = {enable = false;};
        };
      };
    };
    hardware = {
      bluetooth = {
        enable = false;
        enableManager = false;
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
        amd = {enable = false;};
        intel = {enable = false;};
        nvidia = {enable = false;};
      };
      misc = {
        trezor = {enable = false;};
        xbox = {enable = false;};
        yubikey = {enable = false;};
      };
    };
    server = {
      auth = {
        freeipa = {enable = true;};
        keycloak = {enable = true;};
      };
      cache = {enable = true;};
      git = {
        daemon = {
          enable = false;
        };
      };
      hydra = {enable = true;};
      minecraft = {enable = true;};
      teamspeak = {enable = true;};
      databases = {
        mysql = {enable = false;};
        postgresql = {enable = true;};
      };
      services = {
        web = {
          acme = {enable = true;};
          nginx = {enable = true;};
        };
        fail2ban = {enable = true;};
        headscale = {enable = true;};
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

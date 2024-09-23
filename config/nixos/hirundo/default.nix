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

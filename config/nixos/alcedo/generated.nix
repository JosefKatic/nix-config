{
  device = {
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
        };
        windowManager = {
          hyprland = {enable = true;};
          sway = {enable = false;};
        };
      };
    };

    server = {
      auth = {
        freeipa = {enable = false;};
        keycloak = {enable = false;};
      };
      cache = {enable = false;};
      git = {
        daemon = {
          enable = false;
        };
      };
      hydra = {enable = false;};
      minecraft = {enable = false;};
      teamspeak = {enable = false;};
      databases = {
        mysql = {enable = false;};
        postgresql = {enable = false;};
      };
      services = {
        web = {
          acme = {enable = false;};
          nginx = {enable = false;};
        };
        fail2ban = {enable = false;};
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

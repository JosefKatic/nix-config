{ config, lib, ... }: {

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
        "nvidia-settings"        
        ];
    };
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];
  };
  hardware = {
    opengl = {
      driSupport32Bit = true;
    };
    nvidia = {
      prime = {
        offload.enable = false;
        nvidiaBusId = "PCI:01:00:0";
        intelBusId = "PCI:00:02:0";
      };
      # Modesetting is needed for most wayland compositors
      modesetting.enable = true;

      # Use the open source version of the kernel module
      # Only available on driver 515.43.04+
      open = true;
      # Enable the nvidia settings menu
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

   environment = {
    variables = {
      NIXOS_OZONE_WL = "1";
      GBM_BACKEND = "nvidia-drm";
      __GL_GSYNC_ALLOWED = "0";
      __GL_VRR_ALLOWED = "0";
      DISABLE_QT5_COMPAT = "0";
      ANKI_WAYLAND = "1";
      DIRENV_LOG_FORMAT = "";
      WLR_DRM_NO_ATOMIC = "1";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      MOZ_ENABLE_WAYLAND = "1";
      WLR_BACKEND = "vulkan";
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_SESSION_TYPE = "wayland";
      CLUTTER_BACKEND = "wayland";
      WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    };
   };
}
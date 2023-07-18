{ config, lib, ... }: {

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (lib.getName pkg) [
        "nvidia-x11"
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
    openrgb.enable = true;
    opentabletdriver.enable = true;
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

}

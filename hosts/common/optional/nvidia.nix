{ config, lib, pkgs, ... }: {
   services.xserver = {
     videoDrivers = [ "nvidia" ];
   };
   hardware = {
     opengl = {
       driSupport32Bit = true;
        extraPackages = with pkgs; [
          vaapiVdpau
          libvdpau-va-gl
          nvidia-vaapi-driver
       ];
     };
   nvidia = {
     modesetting.enable = true;
     open = true;
     nvidiaSettings = true;
     package = pkgs.linuxKernel.packages.linux_zen.nvidia_x11;
   };
  };
}
